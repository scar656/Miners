// Copyright © 2012, Jakob Bornecrantz.  All rights reserved.
// See copyright notice in src/charge/charge.d (GPLv2 only).
module miners.skin;

import std.stdio;

import std.string : format, find;
import uri = std.uri;

import charge.charge;
import charge.util.png;


/**
 * A threaded TCP connection to the minecraft.net servers. 
 */
class SkinDownloader : public NetHttpConnection
{
private:
	// Server details
	const char[] hostname = "s3.amazonaws.com";
	const ushort port = 80;
	const char[] url = "/MinecraftSkins/%s.png";

	GfxWrappedTexture[string] store;
	string curSkin;
	GfxTexture def;
	Vector!(string) nextSkin;

	mixin SysLogging;


public:
	this(GfxTexture def)
	{
		sysReference(&this.def, def);

		super(hostname, port);
	}

	void close()
	{
		auto a = store.values.dup;
		store = null;
		foreach(tex; a)
			sysReference(&tex, null);
		sysReference(&def, null);

		super.close();
	}

	void doTick()
	{
		if (curSkin is null &&
		    !nextSkin.length)
			return;

		if (curSkin is null) {
			curSkin = nextSkin[nextSkin.length - 1];
			nextSkin.length = nextSkin.length - 1;
		}

		super.doTick();
	}

	GfxTexture getSkin(char[] name)
	{
		auto test = name in store;
		if (test !is null)
			return *test;

		nextSkin ~= name;
		auto str = format("playerSkin/%s.png", name);
		auto ret = new GfxWrappedTexture(str, def);
		store[name] = ret;
		return ret;
	}

	void httpGetSkin(char[] name)
	{
		const char[] http =
		"GET %s HTTP/1.1\r\n"
		"User-Agent: Charged-Miners\r\n"
		"Host: %s\r\n"
		"\r\n";

		auto url = format(this.url, name);
		auto req = format(http, url, hostname);

		s.send(req);
	}

	void handleError(Exception e)
	{
		curSkin = null;
		super.close();
	}

	void handleResponse(char[] header, char[] res)
	{
		try {
			auto str = format("dl/%s.png", curSkin);
			auto img = pngDecode(res);

			auto pic = Picture(str, img);
			scope(exit)
				sysReference(&pic, null);

			auto tex = GfxTexture(str);
			scope(exit)
				sysReference(&tex, null);

			if (tex is null)
				throw new Exception("Failed create texture");

			tex.filter = GfxTexture.Filter.Nearest;
			auto w = store[curSkin];
			w.update(tex);

		} catch (Exception e) {
			l.warn(e.toString);
		}

		curSkin = null;
		super.close();
	}

	void handleConnected()
	{
		httpGetSkin(curSkin);
	}

	void handleDisconnect()
	{
		curSkin = null;
		l.warn("Got disconnected");
	}
}