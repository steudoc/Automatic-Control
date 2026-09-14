#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "untitled_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)
#ifndef SS_UINT64
#define SS_UINT64 17
#endif
#ifndef SS_INT64
#define SS_INT64 18
#endif
#else
#include "builtin_typeid_types.h"
#include "untitled.h"
#include "untitled_capi.h"
#include "untitled_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               ((NULL))
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"untitled/Gain" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 1 , 0 ,
TARGET_STRING ( "untitled/Gain1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0
} , { 2 , 0 , TARGET_STRING ( "untitled/Gain2" ) , TARGET_STRING ( "" ) , 0 ,
0 , 0 , 0 , 1 } , { 3 , 0 , TARGET_STRING ( "untitled/Gain3" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 1 } , { 4 , 0 , TARGET_STRING (
"untitled/Gain4" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 5 , 0 ,
TARGET_STRING ( "untitled/Gain5" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0
} , { 6 , 0 , TARGET_STRING ( "untitled/X1dot->X1" ) , TARGET_STRING ( "" ) ,
0 , 0 , 0 , 0 , 0 } , { 7 , 0 , TARGET_STRING ( "untitled/X2dot->X2" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 8 , 0 , TARGET_STRING (
"untitled/X3dot->X2" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 9 , 0
, TARGET_STRING ( "untitled/Product" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0
, 0 } , { 10 , 0 , TARGET_STRING ( "untitled/Add" ) , TARGET_STRING ( "" ) ,
0 , 0 , 0 , 0 , 0 } , { 11 , 0 , TARGET_STRING ( "untitled/Add1" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 12 , 0 , TARGET_STRING (
"untitled/Add2" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 13 , 0 ,
TARGET_STRING ( "untitled/Sum" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 }
, { 14 , 0 , TARGET_STRING ( "untitled/Sum1" ) , TARGET_STRING ( "" ) , 0 , 0
, 0 , 0 , 0 } , { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ;
static const rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 15 ,
TARGET_STRING ( "untitled/pasto" ) , TARGET_STRING ( "Value" ) , 0 , 0 , 0 }
, { 16 , TARGET_STRING ( "untitled/Gain2" ) , TARGET_STRING ( "Gain" ) , 0 ,
0 , 0 } , { 17 , TARGET_STRING ( "untitled/X1dot->X1" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 18 , TARGET_STRING (
"untitled/X2dot->X2" ) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } ,
{ 19 , TARGET_STRING ( "untitled/X3dot->X2" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 }
} ; static int_T rt_LoggedStateIdxList [ ] = { - 1 } ; static const
rtwCAPI_Signals rtRootInputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 ,
0 , 0 , 0 } } ; static const rtwCAPI_Signals rtRootOutputs [ ] = { { 0 , 0 ,
( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_ModelParameters rtModelParameters [ ] = { { 20 , TARGET_STRING ( "Gb"
) , 0 , 0 , 0 } , { 21 , TARGET_STRING ( "Ib" ) , 0 , 0 , 0 } , { 22 ,
TARGET_STRING ( "V1" ) , 0 , 0 , 0 } , { 23 , TARGET_STRING ( "n" ) , 0 , 0 ,
0 } , { 24 , TARGET_STRING ( "p1" ) , 0 , 0 , 0 } , { 25 , TARGET_STRING (
"p2" ) , 0 , 0 , 0 } , { 26 , TARGET_STRING ( "p3" ) , 0 , 0 , 0 } , { 27 ,
TARGET_STRING ( "r" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . le445jetqe , & rtB . f3x41sbrih ,
& rtB . h1qb2w0hxk , & rtB . nzfgn1l4ax , & rtB . cmg5fmdl0h , & rtB .
beogc55fps , & rtB . j5idespv1t , & rtB . htmd4dt2e5 , & rtB . fmjqtlolcf , &
rtB . f2ryevuvze , & rtB . cmxuyznfme , & rtB . luzqeynz4d , & rtB .
gbjb31rpb2 , & rtB . iwj0o2fumy , & rtB . a4olzxkdsf , & rtP . pasto_Value ,
& rtP . Gain2_Gain , & rtP . X1dotX1_IC , & rtP . X2dotX2_IC , & rtP .
X3dotX2_IC , & rtP . Gb , & rtP . Ib , & rtP . V1 , & rtP . n , & rtP . p1 ,
& rtP . p2 , & rtP . p3 , & rtP . r , } ; static int32_T * rtVarDimsAddrMap [
] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , ( uint8_T ) SS_DOUBLE , 0 , 0 , 0 } }
;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } } ; static const uint_T rtDimensionArray [ ] = {
1 , 1 } ; static const real_T rtcapiStoredFloats [ ] = { 0.0 } ; static const
rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , ( boolean_T ) 0 } , } ; static const
rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( const void * ) &
rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 0 ] , (
int8_T ) 0 , ( uint8_T ) 0 } , { ( NULL ) , ( NULL ) , 1 , 0 } } ; static
rtwCAPI_ModelMappingStaticInfo mmiStatic = { { rtBlockSignals , 15 ,
rtRootInputs , 0 , rtRootOutputs , 0 } , { rtBlockParameters , 5 ,
rtModelParameters , 8 } , { ( NULL ) , 0 } , { rtDataTypeMap , rtDimensionMap
, rtFixPtMap , rtElementMap , rtSampleTimeMap , rtDimensionArray } , "float"
, { 847100831U , 1749084700U , 3758549005U , 1012238763U } , ( NULL ) , 0 , (
boolean_T ) 0 , rt_LoggedStateIdxList } ; const
rtwCAPI_ModelMappingStaticInfo * untitled_GetCAPIStaticMap ( void ) { return
& mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void untitled_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void untitled_host_InitializeDataMapInfo ( untitled_host_DataMapInfo_T *
dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ;
rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ;
rtwCAPI_SetDataAddressMap ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetPath
( dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , ( NULL ) )
; rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
