#ifndef RTW_HEADER_untitled_h_
#define RTW_HEADER_untitled_h_
#ifndef untitled_COMMON_INCLUDES_
#define untitled_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging_simtarget.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "untitled_types.h"
#include <stddef.h>
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME untitled
#define NSAMPLE_TIMES (2) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (15) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (3)   
#elif NCSTATES != 3
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T fmjqtlolcf ; real_T j5idespv1t ; real_T htmd4dt2e5 ;
real_T f3x41sbrih ; real_T cmxuyznfme ; real_T cmg5fmdl0h ; real_T gbjb31rpb2
; real_T beogc55fps ; real_T luzqeynz4d ; real_T iwj0o2fumy ; real_T
le445jetqe ; real_T f2ryevuvze ; real_T a4olzxkdsf ; real_T h1qb2w0hxk ;
real_T nzfgn1l4ax ; } B ; typedef struct { struct { void * LoggedData ; }
azq3dz05k2 ; struct { void * LoggedData ; } hacjhytx5c ; struct { void *
LoggedData ; } npu4ujijoa ; } DW ; typedef struct { real_T cwxyotije3 ;
real_T eecl5sxnwn ; real_T cm2kq1jd4z ; } X ; typedef struct { real_T
cwxyotije3 ; real_T eecl5sxnwn ; real_T cm2kq1jd4z ; } XDot ; typedef struct
{ boolean_T cwxyotije3 ; boolean_T eecl5sxnwn ; boolean_T cm2kq1jd4z ; } XDis
; typedef struct { real_T cwxyotije3 ; real_T eecl5sxnwn ; real_T cm2kq1jd4z
; } CStateAbsTol ; typedef struct { real_T cwxyotije3 ; real_T eecl5sxnwn ;
real_T cm2kq1jd4z ; } CXPtMin ; typedef struct { real_T cwxyotije3 ; real_T
eecl5sxnwn ; real_T cm2kq1jd4z ; } CXPtMax ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T Gb ; real_T
Ib ; real_T V1 ; real_T n ; real_T p1 ; real_T p2 ; real_T p3 ; real_T r ;
real_T X3dotX2_IC ; real_T X1dotX1_IC ; real_T X2dotX2_IC ; real_T
pasto_Value ; real_T Gain2_Gain ; } ; extern const char_T *
RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ; extern DW rtDW ;
extern P rtP ; extern mxArray * mr_untitled_GetDWork ( ) ; extern void
mr_untitled_SetDWork ( const mxArray * ssDW ) ; extern mxArray *
mr_untitled_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * untitled_GetCAPIStaticMap ( void ) ; extern
SimStruct * const rtS ; extern const int_T gblNumToFiles ; extern const int_T
gblNumFrFiles ; extern const int_T gblNumFrWksBlocks ; extern rtInportTUtable
* gblInportTUtables ; extern const char * gblInportFileName ; extern const
int_T gblNumRootInportBlks ; extern const int_T gblNumModelInputs ; extern
const int_T gblInportDataTypeIdx [ ] ; extern const int_T gblInportDims [ ] ;
extern const int_T gblInportComplex [ ] ; extern const int_T
gblInportInterpoFlag [ ] ; extern const int_T gblInportContinuous [ ] ;
extern const int_T gblParameterTuningTid ; extern DataMapInfo *
rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ;
void MdlOutputs ( int_T tid ) ; void MdlOutputsParameterSampleTime ( int_T
tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void
MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ;
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
