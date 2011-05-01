// This file is a hand mangled version of GLU.h
// See the copyright in src/lib/gl/gl.d (BSD/MIT like).
module lib.gl.glu;

import lib.loader;
import lib.gl.types;

void loadGLU(Loader l)
{
//	loadFunc!(gluBuild1DMipmapLevels)(l);
	loadFunc!(gluBuild1DMipmaps)(l);
//	loadFunc!(gluBuild2DMipmapLevels)(l);
	loadFunc!(gluBuild2DMipmaps)(l);
//	loadFunc!(gluBuild3DMipmapLevels)(l);
//	loadFunc!(gluBuild3DMipmaps)(l);
//	loadFunc!(gluCheckExtension)(l);
	loadFunc!(gluErrorString)(l);
	loadFunc!(gluGetString)(l);
	loadFunc!(gluCylinder)(l);
	loadFunc!(gluDisk)(l);
	loadFunc!(gluPartialDisk)(l);
	loadFunc!(gluSphere)(l);
	loadFunc!(gluBeginCurve)(l);
	loadFunc!(gluBeginPolygon)(l);
	loadFunc!(gluBeginSurface)(l);
	loadFunc!(gluBeginTrim)(l);
	loadFunc!(gluEndCurve)(l);
	loadFunc!(gluEndPolygon)(l);
	loadFunc!(gluEndSurface)(l);
	loadFunc!(gluEndTrim)(l);
	loadFunc!(gluDeleteNurbsRenderer)(l);
	loadFunc!(gluDeleteQuadric)(l);
	loadFunc!(gluDeleteTess)(l);
	loadFunc!(gluGetNurbsProperty)(l);
	loadFunc!(gluGetTessProperty)(l);
	loadFunc!(gluLoadSamplingMatrices)(l);
	loadFunc!(gluNewNurbsRenderer)(l);
	loadFunc!(gluNewQuadric)(l);
	loadFunc!(gluNewTess)(l);
	loadFunc!(gluNextContour)(l);
	loadFunc!(gluNurbsCallback)(l);
//	loadFunc!(gluNurbsCallbackData)(l);
//	loadFunc!(gluNurbsCallbackDataEXT)(l);
	loadFunc!(gluNurbsCurve)(l);
	loadFunc!(gluNurbsProperty)(l);
	loadFunc!(gluNurbsSurface)(l);
	loadFunc!(gluPwlCurve)(l);
	loadFunc!(gluQuadricCallback)(l);
	loadFunc!(gluQuadricDrawStyle)(l);
	loadFunc!(gluQuadricNormals)(l);
	loadFunc!(gluQuadricOrientation)(l);
	loadFunc!(gluQuadricTexture)(l);
	loadFunc!(gluTessBeginContour)(l);
	loadFunc!(gluTessBeginPolygon)(l);
	loadFunc!(gluTessCallback)(l);
	loadFunc!(gluTessEndContour)(l);
	loadFunc!(gluTessEndPolygon)(l);
	loadFunc!(gluTessNormal)(l);
	loadFunc!(gluTessProperty)(l);
	loadFunc!(gluTessVertex)(l);
	loadFunc!(gluLookAt)(l);
	loadFunc!(gluOrtho2D)(l);
	loadFunc!(gluPerspective)(l);
	loadFunc!(gluPickMatrix)(l);
	loadFunc!(gluProject)(l);
	loadFunc!(gluScaleImage)(l);
	loadFunc!(gluUnProject)(l);
//	loadFunc!(gluUnProject4)(l);
}

const GLU_VERSION = 100800;
const GLU_EXTENSIONS = 100801;
const GLU_INVALID_ENUM = 100900;
const GLU_INVALID_VALUE = 100901;
const GLU_OUT_OF_MEMORY = 100902;
const GLU_INVALID_OPERATION = 100904;
const GLU_OUTLINE_POLYGON = 100240;
const GLU_OUTLINE_PATCH = 100241;
const GLU_NURBS_ERROR = 100103;
const GLU_ERROR = 100103;
const GLU_NURBS_BEGIN = 100164;
const GLU_NURBS_BEGIN_EXT = 100164;
const GLU_NURBS_VERTEX = 100165;
const GLU_NURBS_VERTEX_EXT = 100165;
const GLU_NURBS_NORMAL = 100166;
const GLU_NURBS_NORMAL_EXT = 100166;
const GLU_NURBS_COLOR = 100167;
const GLU_NURBS_COLOR_EXT = 100167;
const GLU_NURBS_TEXTURE_COORD = 100168;
const GLU_NURBS_TEX_COORD_EXT = 100168;
const GLU_NURBS_END = 100169;
const GLU_NURBS_END_EXT = 100169;
const GLU_NURBS_BEGIN_DATA = 100170;
const GLU_NURBS_BEGIN_DATA_EXT = 100170;
const GLU_NURBS_VERTEX_DATA = 100171;
const GLU_NURBS_VERTEX_DATA_EXT = 100171;
const GLU_NURBS_NORMAL_DATA = 100172;
const GLU_NURBS_NORMAL_DATA_EXT = 100172;
const GLU_NURBS_COLOR_DATA = 100173;
const GLU_NURBS_COLOR_DATA_EXT = 100173;
const GLU_NURBS_TEXTURE_COORD_DATA = 100174;
const GLU_NURBS_TEX_COORD_DATA_EXT = 100174;
const GLU_NURBS_END_DATA = 100175;
const GLU_NURBS_END_DATA_EXT = 100175;
const GLU_NURBS_ERROR1 = 100251;
const GLU_NURBS_ERROR2 = 100252;
const GLU_NURBS_ERROR3 = 100253;
const GLU_NURBS_ERROR4 = 100254;
const GLU_NURBS_ERROR5 = 100255;
const GLU_NURBS_ERROR6 = 100256;
const GLU_NURBS_ERROR7 = 100257;
const GLU_NURBS_ERROR8 = 100258;
const GLU_NURBS_ERROR9 = 100259;
const GLU_NURBS_ERROR10 = 100260;
const GLU_NURBS_ERROR11 = 100261;
const GLU_NURBS_ERROR12 = 100262;
const GLU_NURBS_ERROR13 = 100263;
const GLU_NURBS_ERROR14 = 100264;
const GLU_NURBS_ERROR15 = 100265;
const GLU_NURBS_ERROR16 = 100266;
const GLU_NURBS_ERROR17 = 100267;
const GLU_NURBS_ERROR18 = 100268;
const GLU_NURBS_ERROR19 = 100269;
const GLU_NURBS_ERROR20 = 100270;
const GLU_NURBS_ERROR21 = 100271;
const GLU_NURBS_ERROR22 = 100272;
const GLU_NURBS_ERROR23 = 100273;
const GLU_NURBS_ERROR24 = 100274;
const GLU_NURBS_ERROR25 = 100275;
const GLU_NURBS_ERROR26 = 100276;
const GLU_NURBS_ERROR27 = 100277;
const GLU_NURBS_ERROR28 = 100278;
const GLU_NURBS_ERROR29 = 100279;
const GLU_NURBS_ERROR30 = 100280;
const GLU_NURBS_ERROR31 = 100281;
const GLU_NURBS_ERROR32 = 100282;
const GLU_NURBS_ERROR33 = 100283;
const GLU_NURBS_ERROR34 = 100284;
const GLU_NURBS_ERROR35 = 100285;
const GLU_NURBS_ERROR36 = 100286;
const GLU_NURBS_ERROR37 = 100287;
const GLU_AUTO_LOAD_MATRIX = 100200;
const GLU_CULLING = 100201;
const GLU_SAMPLING_TOLERANCE = 100203;
const GLU_DISPLAY_MODE = 100204;
const GLU_PARAMETRIC_TOLERANCE = 100202;
const GLU_SAMPLING_METHOD = 100205;
const GLU_U_STEP = 100206;
const GLU_V_STEP = 100207;
const GLU_NURBS_MODE = 100160;
const GLU_NURBS_MODE_EXT = 100160;
const GLU_NURBS_TESSELLATOR = 100161;
const GLU_NURBS_TESSELLATOR_EXT = 100161;
const GLU_NURBS_RENDERER = 100162;
const GLU_NURBS_RENDERER_EXT = 100162;
const GLU_OBJECT_PARAMETRIC_ERROR = 100208;
const GLU_OBJECT_PARAMETRIC_ERROR_EXT = 100208;
const GLU_OBJECT_PATH_LENGTH = 100209;
const GLU_OBJECT_PATH_LENGTH_EXT = 100209;
const GLU_PATH_LENGTH = 100215;
const GLU_PARAMETRIC_ERROR = 100216;
const GLU_DOMAIN_DISTANCE = 100217;
const GLU_MAP1_TRIM_2 = 100210;
const GLU_MAP2_TRIM_3 = 100211;
const GLU_POINT = 100010;
const GLU_LINE = 100011;
const GLU_FILL = 100012;
const GLU_SILHOUETTE = 100013;
const GLU_SMOOTH = 100000;
const GLU_FLAT = 100001;
const GLU_NONE = 100002;
const GLU_OUTSITE = 100020;
const GLU_INSIDE = 100021;
const GLU_TESS_BEGIN = 100100;
const GLU_BEGIN = 100100;
const GLU_TESS_VERTEX = 100101;
const GLU_VERTEX = 100101;
const GLU_TESS_END = 100102;
const GLU_END = 100102;
const GLU_TESS_ERROR = 100103;
const GLU_TESS_EDGE_FLAG = 100104;
const GLU_EDGE_FLAG = 100104;
const GLU_TESS_COMBINE = 100105;
const GLU_TESS_BEGIN_DATA = 100106;
const GLU_TESS_VERTEX_DATA = 100107;
const GLU_TESS_END_DATA = 100108;
const GLU_TESS_ERROR_DATA = 100109;
const GLU_TESS_EDGE_FLAG_DATA = 100110;
const GLU_TESS_COMBINE_DATA = 100111;
const GLU_CW = 100120;
const GLU_CCW = 100121;
const GLU_INTERIOR = 100122;
const GLU_EXTERIOR = 100123;
const GLU_UNKNOWN = 100124;
const GLU_TESS_WINDING_RULE = 100140;
const GLU_TESS_BOUNDARY_ONLY = 100141;
const GLU_TESS_TOLERANCE = 100142;
const GLU_TESS_ERROR1 = 100151;
const GLU_TESS_ERROR2 = 100152;
const GLU_TESS_ERROR3 = 100153;
const GLU_TESS_ERROR4 = 100154;
const GLU_TESS_ERROR5 = 100155;
const GLU_TESS_ERROR6 = 100156;
const GLU_TESS_ERROR7 = 100157;
const GLU_TESS_ERROR8 = 100158;
const GLU_TESS_MISSING_BEGIN_POLYGON = 100151;
const GLU_TESS_MISSING_BEGIN_COUNTER = 100152;
const GLU_TESS_MISSING_END_POLYGON = 100153;
const GLU_TESS_MISSING_END_COUNTER = 100154;
const GLU_TESS_COORD_TOO_LARGE = 100155;
const GLU_TESS_NEED_COMBINE_CALLBACK = 100156;
const GLU_TESS_WINDING_ODD = 100130;
const GLU_TESS_WINDING_NONZERO = 100131;
const GLU_TESS_WINDING_POSITIVE = 100132;
const GLU_TESS_WINDING_NEGATIVE = 100133;
const GLU_TESS_WINDING_ABS_GEQ_TWO = 100134;
const GLdouble GLU_TESS_MAX_COORD = 1.0e150;

struct GLUnurbs {}
struct GLUquadric {}
struct GLUtesselator {}

typedef GLUnurbs GLUnurbsObj;
typedef GLUquadric GLUquadricObj;
typedef GLUtesselator GLUtesselatorObj;
typedef GLUtesselator GLUtriangulatorObj;

extern(System) typedef void function() _GLUfuncptr;

extern(System):

GLint (*gluBuild1DMipmapLevels)(GLenum,GLint,GLsizei,GLenum,GLenum,GLint,GLint,GLint,void*);
GLint (*gluBuild1DMipmaps)(GLenum,GLint,GLsizei,GLenum,GLenum,void*);
GLint (*gluBuild2DMipmapLevels)(GLenum,GLint,GLsizei,GLsizei,GLenum,GLenum,GLint,GLint,GLint,void*);
GLint (*gluBuild2DMipmaps)(GLenum,GLint,GLsizei,GLsizei,GLenum,GLenum,void*);
GLint (*gluBuild3DMipmapLevels)(GLenum,GLint,GLsizei,GLsizei,GLsizei,GLenum,GLenum,GLint,GLint,GLint,void*);
GLint (*gluBuild3DMipmaps)(GLenum,GLint,GLsizei,GLsizei,GLsizei,GLenum,GLenum,void*);
GLboolean (*gluCheckExtension)(GLubyte*,GLubyte*);
GLubyte* (*gluErrorString)(GLenum);
GLubyte* (*gluGetString)(GLenum);
void (*gluCylinder)(GLUquadric*,GLdouble,GLdouble,GLdouble,GLint,GLint);
void (*gluDisk)(GLUquadric*,GLdouble,GLdouble,GLint,GLint);
void (*gluPartialDisk)(GLUquadric*,GLdouble,GLdouble,GLint,GLint,GLdouble,GLdouble);
void (*gluSphere)(GLUquadric*,GLdouble,GLint,GLint);
void (*gluBeginCurve)(GLUnurbs*);
void (*gluBeginPolygon)(GLUtesselator*);
void (*gluBeginSurface)(GLUnurbs*);
void (*gluBeginTrim)(GLUnurbs*);
void (*gluEndCurve)(GLUnurbs*);
void (*gluEndPolygon)(GLUtesselator*);
void (*gluEndSurface)(GLUnurbs*);
void (*gluEndTrim)(GLUnurbs*);
void (*gluDeleteNurbsRenderer)(GLUnurbs*);
void (*gluDeleteQuadric)(GLUquadric*);
void (*gluDeleteTess)(GLUtesselator*);
void (*gluGetNurbsProperty)(GLUnurbs*,GLenum,GLfloat*);
void (*gluGetTessProperty)(GLUtesselator*,GLenum,GLdouble*);
void (*gluLoadSamplingMatrices)(GLUnurbs*,GLfloat*,GLfloat*,GLint*);
GLUnurbs* (*gluNewNurbsRenderer)();
GLUquadric* (*gluNewQuadric)();
GLUtesselator* (*gluNewTess)();
void (*gluNextContour)(GLUtesselator*,GLenum);
void (*gluNurbsCallback)(GLUnurbs*,GLenum,_GLUfuncptr);
void (*gluNurbsCallbackData)(GLUnurbs*,GLvoid*);
void (*gluNurbsCallbackDataEXT)(GLUnurbs*,GLvoid*);
void (*gluNurbsCurve)(GLUnurbs*,GLint,GLfloat*,GLint,GLfloat*,GLint,GLenum);
void (*gluNurbsProperty)(GLUnurbs*,GLenum,GLfloat);
void (*gluNurbsSurface)(GLUnurbs*,GLint,GLfloat*,GLint,GLfloat*,GLint,GLint,GLfloat*,GLint,GLint,GLenum);
void (*gluPwlCurve)(GLUnurbs*,GLint,GLfloat*,GLint,GLenum);
void (*gluQuadricCallback)(GLUquadric*,GLenum,_GLUfuncptr);
void (*gluQuadricDrawStyle)(GLUquadric*,GLenum);
void (*gluQuadricNormals)(GLUquadric*,GLenum);
void (*gluQuadricOrientation)(GLUquadric*,GLenum);
void (*gluQuadricTexture)(GLUquadric*,GLboolean);
void (*gluTessBeginContour)(GLUtesselator*);
void (*gluTessBeginPolygon)(GLUtesselator*,GLvoid*);
void (*gluTessCallback)(GLUtesselator*,GLenum,_GLUfuncptr);
void (*gluTessEndContour)(GLUtesselator*);
void (*gluTessEndPolygon)(GLUtesselator*);
void (*gluTessNormal)(GLUtesselator*,GLdouble,GLdouble,GLdouble);
void (*gluTessProperty)(GLUtesselator*,GLenum,GLdouble);
void (*gluTessVertex)(GLUtesselator*,GLdouble*,GLvoid*);
void (*gluLookAt)(GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble);
void (*gluOrtho2D)(GLdouble,GLdouble,GLdouble,GLdouble);
void (*gluPerspective)(GLdouble,GLdouble,GLdouble,GLdouble);
void (*gluPickMatrix)(GLdouble,GLdouble,GLdouble,GLdouble,GLint*);
GLint (*gluProject)(GLdouble,GLdouble,GLdouble,GLdouble*,GLdouble*,GLint*,GLdouble*,GLdouble*,GLdouble*);
GLint (*gluScaleImage)(GLenum,GLsizei,GLsizei,GLenum,void*,GLsizei,GLsizei,GLenum,GLvoid*);
GLint (*gluUnProject)(GLdouble,GLdouble,GLdouble,GLdouble*,GLdouble*,GLint*,GLdouble*,GLdouble*,GLdouble*);
GLint (*gluUnProject4)(GLdouble,GLdouble,GLdouble,GLdouble,GLdouble*,GLdouble*,GLint*,GLdouble,GLdouble,GLdouble*,GLdouble*,GLdouble*,GLdouble*);
