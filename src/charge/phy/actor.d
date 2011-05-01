// Copyright © 2011, Jakob Bornecrantz.  All rights reserved.
// See copyright notice in src/charge/charge.d (GPLv2 only).
module charge.phy.actor;

import std.stdio;

import charge.math.movable;

import charge.phy.ode;
import charge.phy.geom;
import charge.phy.material;
import charge.phy.world;

class Actor : public Movable
{
	this(World w)
	{
		this.w = w;
		mat = Material();
	}

	Material material() { return mat; }
	void material(Material mat) { this.mat = mat; }

protected:
	World w;
	Material mat;
}

class Body : public Actor
{
protected:
	dBodyID dBody;
	/// a trick to not allocate another buffer for most usecases.
	dGeomID static_store[1];
	dGeomID geoms[];
	uint num_geoms;

public:
	this(World w, Point3d pos)
	{
		super(w);
		dMass m;
		dBody = dBodyCreate(w.world);
		Actor a = this;
		dBodySetData(dBody, cast(void*)a);
		setPosition(pos);
		// default mass just in case
		massSetBox(1.0, 1.0, 1.0, 1.0);
		geoms = static_store;
	}

	~this()
	{
		for(int i; i < num_geoms; i++)
			dGeomDestroy(geoms[i]);
		dBodyDestroy(dBody);
	}

	/*
	 * Collision functions
	 */

	void collisionBox(double x, double y, double z)
	{
		auto geom = dCreateBox(w.body_space, x, y, z);
		dGeomSetBody(geom, dBody);
		addGeom(geom);
	}

	void collisionBoxAt(Point3d pos, double x, double y, double z)
	{
		auto geom = dCreateGeomTransform(w.body_space);
		dGeomTransformSetCleanup(geom, 1);
		dGeomTransformSetInfo(geom, 1);
		auto temp = dCreateBox(null, x, y, z);
		dGeomTransformSetGeom(geom, temp);
		dGeomSetPosition(temp, pos.x, pos.y, pos.z);
		dGeomSetBody(geom, dBody);
		addGeom(geom);
	}

	void collisionSphere(double r)
	{
		auto geom = dCreateSphere(w.body_space, r);
		dGeomSetBody(geom, dBody);
		addGeom(geom);
	}

	void collisionSphereAt(Point3d pos, double r)
	{
		auto geom = dCreateGeomTransform(w.body_space);
		dGeomTransformSetCleanup(geom, 1);
		dGeomTransformSetInfo(geom, 1);
		auto temp = dCreateSphere(null, r);
		dGeomTransformSetGeom(geom, temp);
		dGeomSetPosition(temp, pos.x, pos.y, pos.z);
		dGeomSetBody(geom, dBody);
		addGeom(geom);
	}

	/*
	 * Mass functions
	 */

	void massSetBox(double total_mass, double x, double y, double z)
	{
		dMass m;
		dMassSetZero(&m);
		dMassSetBoxTotal(&m, total_mass, x, y, z);
		dBodySetMass(dBody, &m);
	}

	void massSetSphere(double total_mass, double r)
	{
		dMass m;
		dMassSetZero(&m);
		dMassSetSphereTotal(&m, total_mass, r);
		dBodySetMass(dBody, &m);
	}

	/*
	 * Force functions
	 */
	
	void addForce(Vector3d vec)
	{
		dBodyAddForce(dBody, vec.x, vec.y, vec.z);
	}

	Vector3d velocity()
	{
		// Stupid gdc bug
		float *vec = dBodyGetLinearVel(dBody);
		return Vector3d(vec[0], vec[1], vec[2]);
	}

	/*
	 * From Movable
	 */

	void setPosition(ref Point3d pos)
	{
		dBodySetPosition(dBody, pos.x, pos.y, pos.z);
	}

	void setRotation(ref Quatd q)
	{
		dVector4 rot;
		rot[0] = q.w;
		rot[1] = q.x;
		rot[2] = q.y;
		rot[3] = q.z;
		dBodySetQuaternion(dBody, rot);
	}

	void getPosition(out Point3d p)
	{
		dVector3 pos;
		dBodyCopyPosition(dBody, pos);
		p.x = pos[0];
		p.y = pos[1];
		p.z = pos[2];
	}

	void getRotation(out Quatd q)
	{
		dVector4 rot;
		dBodyCopyQuaternion(dBody, rot);
		q.w = rot[0];
		q.x = rot[1];
		q.y = rot[2];
		q.z = rot[3];
	}

private:
	void addGeom(dGeomID geom)
	{
		if (num_geoms >= geoms.length)
			geoms.length = geoms.length * 2;
		geoms[num_geoms++] = geom;
	}

}

class Static : public Actor
{
protected:
	Geom geom;

public:
	this(World world, Geom geom)
	in
	{
		assert(world !is null);
		assert(geom !is null);
		assert(geom.geom !is null);
	}
	body
	{
		super(world);
		this.geom = geom;

		dSpaceAdd(world.static_space, geom.geom);
	}

	~this()
	{
		delete geom;
	}

	void setPosition(ref Point3d pos)
	{
		dGeomSetPosition(geom.geom, pos.x, pos.y, pos.z);
	}

	void setRotation(ref Quatd q)
	{
		dVector4 rot;
		rot[0] = q.w;
		rot[1] = q.x;
		rot[2] = q.y;
		rot[3] = q.z;
		dGeomSetQuaternion(geom.geom, rot);
	}

	void getPosition(out Point3d p)
	{
		dVector3 pos;
		dGeomCopyPosition(geom.geom, pos);
		p.x = pos[0];
		p.y = pos[1];
		p.z = pos[2];
	}

	void getRotation(out Quatd q)
	{
		dVector4 rot;
		dGeomGetQuaternion(geom.geom, rot);
		q.w = rot[0];
		q.x = rot[1];
		q.y = rot[2];
		q.z = rot[3];
	}

}
