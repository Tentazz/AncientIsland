// Made with Amplify Shader Editor v1.9.9.4
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Codex/VFX/VFX"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Toggle] _AppearsonlyforspecificFaction( "Appears only for specific Faction ", Range( 0, 1 ) ) = 0
		[Enum(Admech,0,Necron,1,Votann,2)] _Activeforfaction( "Active for faction", Float ) = 0
		_Color( "Color", Color ) = ( 1, 1, 1, 1 )
		[Toggle] _UseGradientascolor( "Use Gradient as color", Range( 0, 1 ) ) = 0
		_ColorGradientadjust( "Color Gradient adjust", Float ) = 1
		_ColorGradient( "Color Gradient", 2D ) = "white" {}
		_Intensity( "Intensity", Float ) = 1
		[Enum(Strong,4,Light,2,Off,1)] _CompensateFadingExposure( "Compensate Fading Exposure ", Range( 1, 4 ) ) = 4
		_Alpha( "Alpha", Range( 0, 10 ) ) = 1
		_AlphaErosion( "Alpha Erosion", Range( 0, 1 ) ) = 0
		_AlphaErosionPower( "Alpha Erosion Power", Range( 1, 4 ) ) = 2
		[Header(RADIAL GRADIENT)][Toggle] _RadialGradient( "Radial Gradient", Range( 0, 1 ) ) = 0
		[Toggle] _RadialGradientingammaspace( "Radial Gradient in gamma space", Range( 0, 1 ) ) = 0
		_RedialGradientPower( "Redial Gradient Power", Range( 0.01, 5 ) ) = 1
		_RedialGradientinvertedPower( "Redial Gradient inverted Power", Range( 0.01, 5 ) ) = 1
		_RadialGradienttiling( "Radial Gradient tiling", Vector ) = ( 1, 1, 0, 0 )
		[Toggle] _LinearGradients( "Linear Gradients", Range( 0, 1 ) ) = 1
		_LinearGradientpower( "Linear Gradient power", Float ) = 1
		_GradientpositifU( "Gradient positif U", Range( 0.00001, 1 ) ) = 0.00001
		_GradientnegatifU( "Gradient negatif U", Range( 0.00001, 1 ) ) = 0.00001
		_GradientpositifV( "Gradient positif V", Range( 0.00001, 1 ) ) = 0.00001
		_GradientnegatifV( "Gradient negatif V", Range( 0.00001, 1 ) ) = 0.00001
		[Header(MAIN TEXTURE)] _MainTex( "MainTex", 2D ) = "white" {}
		[Toggle] _WorldpositionMainTexture( "World position Main Texture", Range( 0, 1 ) ) = 0
		_WorldpositionUVscale( "World position UV scale", Float ) = 1
		[Enum(R,0,G,1,B,2,A,3,RGB,4)] _Channelusedasalpha( "Channel used as alpha", Float ) = 1
		_Chromaticabberation( "Chromatic abberation", Range( 0, 0.1 ) ) = 0
		_Tilingandoffset( "Tiling and offset", Vector ) = ( 1, 1, 0, 0 )
		_ScrollingSpeed( "Scrolling Speed", Vector ) = ( 0, 0, 0, 0 )
		[Header(POLAR UVs)][Toggle] _PolarUV( "Polar UV", Range( 0, 1 ) ) = 0
		_PolartilingU( "Polar tiling U", Float ) = 1
		_PolartilingV( "Polar tiling V", Float ) = 1
		_TwistEdges( "Twist Edges", Float ) = 0
		_Twistcenter( "Twist center", Float ) = 0
		_PolarUVCenter( "Polar UV Center", Vector ) = ( 0.5, 0.5, 0, 0 )
		_PolarpowerV( "Polar power V", Float ) = 1
		[Header(DEPTH FADE)][Toggle] _DepthFade( "Depth Fade", Range( 0, 1 ) ) = 0
		_InverseDepthfadeintensity( "Inverse Depth fade intensity", Float ) = 0
		[Toggle] _InverseDepthfade( "Inverse Depth fade", Range( 0, 1 ) ) = 0
		_DepthDistance( "Depth Distance", Float ) = 1
		[Header(DISTORTION)] _DistortionIntensity( "Distortion Intensity", Range( 0, 1 ) ) = 0
		[Toggle] _Distortioninfluencedbyalpha( "Distortion influenced by alpha", Range( 0, 1 ) ) = 0
		_DistortionAlphapower( "Distortion Alpha power", Range( 0.001, 2 ) ) = 1
		_DistortionTexture( "Distortion Texture", 2D ) = "white" {}
		_ScrollingSpeedDistortion( "Scrolling Speed Distortion", Vector ) = ( 0, 0, 0, 0 )
		_TilingandoffsetDistortion( "Tiling and offset Distortion", Vector ) = ( 1, 1, 0, 0 )
		[Toggle] _WorldpositionDistortion( "World position Distortion", Range( 0, 1 ) ) = 0
		_WorldpositionDistortionUVscale( "World position Distortion UV scale", Float ) = 1
		[Header(VERTEX OFFSET)][Toggle] _VertexoffsetfromAlpha( "Vertex offset from Alpha", Range( 0, 1 ) ) = 0
		[Toggle] _VertexoffsetinWorldSpace( "Vertex offset in World Space", Range( 0, 1 ) ) = 0
		_VertexoffsetTexture( "Vertex offset Texture", 2D ) = "white" {}
		_Vertexoffsetsize( "Vertex offset size", Float ) = 1
		_VertexOffsetintensity( "Vertex Offset intensity", Range( 0, 10 ) ) = 0
		[Toggle] _Vertexoffsetgradient( "Vertex offset gradient", Range( 0, 1 ) ) = 1
		[Header(TRAIL)][Toggle] _Trail( "Trail", Range( 0, 1 ) ) = 0
		[Toggle] _onlyinNoosphere( "only in Noosphere", Float ) = 0

		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 1
		//[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		//[HideInInspector] _ShadowMatteFilter("Shadow Matte Filter", Float) = 2.006836
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0 // StencilUsage.Clear
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 0 // Nothing
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 8 // StencilUsage.TraceReflectionRay
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 2 // StencilUsage.DistortionVectors
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 2 // StencilUsage.DistortionVectors
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 2 // StencilUsage.RequiresDeferredLighting
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector][ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0
		[HideInInspector][ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector] _SurfaceType("Surface Type", Float) = 1
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector][ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector][ToggleUI] _TransparentZWrite("Transparent ZWrite", Float) = 0
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _TransparentSortPriority("Transparent Sort Priority", Float) = 0
		[HideInInspector][ToggleUI] _EnableFogOnTransparent("Enable Fog", Float) = 1
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2 // This mode is dedicated to Forward to correctly handle backface then front face rendering thin transparent
		[HideInInspector][Enum(Default, 0, Front, 1, Back, 2)]_TransparentCullMode("_TransparentCullMode", Float) = 2
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Opaque", Int) = 4 // Less equal
		[HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Int) = 4// Less equal
		[HideInInspector][ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector][ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 0
		[HideInInspector][ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 0
		[HideInInspector][ToggleUI] _DoubleSidedEnable("Double Sided Enable", Float) = 1
		[HideInInspector][Enum(Default, 0, Flip, 1, Mirror, 2, None, 3)]_DoubleSidedNormalMode("Double Sided Normal Mode", Float) = 2
		[HideInInspector]_DoubleSidedConstants("DoubleSidedConstants", Vector, 4) = (1, 1, -1, 0)
		[HideInInspector] _DistortionEnable("_DistortionEnable",Float) = 0
		[HideInInspector] _DistortionOnly("_DistortionOnly",Float) = 0

		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleUI] _TransparentWritingMotionVec("Transparent Writing MotionVec", Float) = 0
		[HideInInspector][Enum(UnityEngine.Rendering.HighDefinition.OpaqueCullMode)] _OpaqueCullMode("_OpaqueCullMode", Int) = 2 // Back culling by default
		[HideInInspector][ToggleUI] _SupportDecals("Support Decals", Float) = 1
		[HideInInspector][ToggleUI] _ReceivesSSRTransparent("Receives SSR Transparent", Float) = 0
		[HideInInspector] _EmissionColor("Color", Color) = (1, 1, 1)
		[HideInInspector] _UnlitColorMap_MipInfo("_UnlitColorMap_MipInfo", Vector) = (0, 0, 0, 0)

		[HideInInspector][Enum(Default, 0, Auto, 1, On, 2, Off, 3)]_DoubleSidedGIMode("Double sided GI mode", Float) = 0
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Transparent" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma exclude_renderers glcore gles gles3 ps4 

        #define SUPPORT_GLOBAL_MIP_BIAS 1

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"
		#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward Unlit"
			Tags { "LightMode"="ForwardOnly" }

			Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]
			Blend 1 One OneMinusSrcAlpha
			Blend 2 One [_DstBlend2]
			Blend 3 One [_DstBlend2]
			Blend 4 One OneMinusSrcAlpha

			Cull [_CullModeForward]
			ZTest [_ZTestDepthEqualForOpaque]
			ZWrite [_ZWrite]

			ColorMask [_ColorMaskTransparentVel] 1

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM

			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define HAVE_MESH_MODIFICATION 1
			#define ASE_VERSION 19904
			#define ASE_SRP_VERSION 170200


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

	        #if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
	        #define _WRITE_TRANSPARENT_MOTION_VECTOR
	        #endif

			#define SHADERPASS SHADERPASS_FORWARD_UNLIT
            #define SUPPORT_GLOBAL_MIP_BIAS 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#if defined(_ENABLE_SHADOW_MATTE) && SHADERPASS == SHADERPASS_FORWARD_UNLIT
				#define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
				#define HAS_LIGHTLOOP
				#define SHADOW_OPTIMIZE_REGISTER_USAGE 1

				#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Shadow/HDShadowContext.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/HDShadow.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/PunctualLightCommon.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/HDShadowLoop.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _Color;
			float4 _Tilingandoffset;
			float4 _TilingandoffsetDistortion;
			float2 _ScrollingSpeedDistortion;
			float2 _RadialGradienttiling;
			float2 _ScrollingSpeed;
			float2 _PolarUVCenter;
			float _LinearGradients;
			float _LinearGradientpower;
			float _GradientnegatifV;
			float _Vertexoffsetsize;
			float _GradientnegatifU;
			float _GradientpositifU;
			float _RadialGradient;
			float _RedialGradientinvertedPower;
			float _GradientpositifV;
			float _AlphaErosionPower;
			float _DepthFade;
			float _DepthDistance;
			float _InverseDepthfadeintensity;
			float _InverseDepthfade;
			float _ColorGradientadjust;
			float _UseGradientascolor;
			float _Intensity;
			float _Alpha;
			float _Trail;
			float _onlyinNoosphere;
			float _AlphaErosion;
			float _RedialGradientPower;
			float _Channelusedasalpha;
			float _CompensateFadingExposure;
			float _VertexoffsetinWorldSpace;
			float _VertexOffsetintensity;
			float _VertexoffsetfromAlpha;
			float _Vertexoffsetgradient;
			float _WorldpositionDistortionUVscale;
			float _WorldpositionDistortion;
			float _DistortionIntensity;
			float _DistortionAlphapower;
			float _Distortioninfluencedbyalpha;
			float _Twistcenter;
			float _TwistEdges;
			float _PolarpowerV;
			float _PolartilingU;
			float _PolartilingV;
			float _PolarUV;
			float _WorldpositionUVscale;
			float _WorldpositionMainTexture;
			float _Chromaticabberation;
			float _Activeforfaction;
			float _RadialGradientingammaspace;
			float _AppearsonlyforspecificFaction;
			float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _EnableBlendModePreserveSpecularLighting;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _VertexoffsetTexture;
			sampler2D _MainTex;
			sampler2D _DistortionTexture;
			sampler2D _ColorGradient;
			float _Global_Admech_View;
			float _Global_Necron_View;
			float _Global_Faction;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_SCREEN_POSITION_NORMALIZED


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			struct SurfaceDescription
			{
				float3 Color;
				float3 Emission;
				float4 ShadowTint;
				float Alpha;
				float AlphaClipThreshold;
				float4 VTPackedFeedback;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				surfaceData.color = surfaceDescription.Color;
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription , FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif

				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#if _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);

				#ifdef WRITE_NORMAL_BUFFER
				surfaceData.normalWS = fragInputs.tangentToWorld[2];
				#endif

				#if defined(_ENABLE_SHADOW_MATTE) && SHADERPASS == SHADERPASS_FORWARD_UNLIT
					HDShadowContext shadowContext = InitShadowContext();
					float shadow;
					float3 shadow3;
					posInput = GetPositionInput(fragInputs.positionSS.xy, _ScreenSize.zw, fragInputs.positionSS.z, UNITY_MATRIX_I_VP, UNITY_MATRIX_V);
					float3 normalWS = normalize(fragInputs.tangentToWorld[1]);
					uint renderingLayers = GetMeshRenderingLayerMask();
					ShadowLoopMin(shadowContext, posInput, normalWS, asuint(_ShadowMatteFilter), renderingLayers, shadow3);
					shadow = dot(shadow3, float3(1.0f/3.0f, 1.0f/3.0f, 1.0f/3.0f));

					float4 shadowColor = (1 - shadow)*surfaceDescription.ShadowTint.rgba;
					float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);

					#ifdef _SURFACE_TYPE_TRANSPARENT
						surfaceData.color = lerp(shadowColor.rgb*surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow), surfaceDescription.Alpha);
					#else
						surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow);
					#endif
					localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
					surfaceDescription.Alpha = localAlpha;
				#endif

				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity = surfaceDescription.Alpha;

				#if defined(DEBUG_DISPLAY)
					builtinData.renderingLayers = GetMeshRenderingLayerMask();
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				#ifdef UNITY_VIRTUAL_TEXTURING
                builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif

                ApplyDebugToBuiltinData(builtinData);
			}

			float GetDeExposureMultiplier()
			{
			#if defined(DISABLE_UNLIT_DEEXPOSURE)
				return 1.0;
			#else
				return _DeExposureMultiplier;
			#endif
			}

			PackedVaryingsMeshToPS VertexFunction( AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS o;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float2 texCoord360 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float3 ase_positionWS = GetAbsolutePositionWS( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float2 appendResult363 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult361 = lerp( texCoord360 , ( appendResult363 / _Vertexoffsetsize ) , _VertexoffsetinWorldSpace);
				float lerpResult286 = lerp( 0.0 , inputMesh.ase_color.a , _VertexoffsetfromAlpha);
				float2 texCoord276 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult368 = lerp( 1.0 , ( texCoord276.x * ( 1.0 - texCoord276.x ) * 4.0 ) , _Vertexoffsetgradient);
				
				o.ase_texcoord1.xy = inputMesh.ase_texcoord.xy;
				o.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( ( tex2Dlod( _VertexoffsetTexture, float4( lerpResult361, 0, 0.0) ) + -0.5 ) * _VertexOffsetintensity * ( 1.0 - lerpResult286 ) * lerpResult368 ).rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);
				o.positionRWS = positionRWS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#ifdef UNITY_VIRTUAL_TEXTURING
			#define VT_BUFFER_TARGET SV_Target1
			#define EXTRA_BUFFER_TARGET SV_Target2
			#else
			#define EXTRA_BUFFER_TARGET SV_Target1
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput,
						out float4 outColor : SV_Target0
						#ifdef UNITY_VIRTUAL_TEXTURING
						,out float4 outVTFeedback : VT_BUFFER_TARGET
						#endif
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
					
					)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 PositionRWS = packedInput.positionRWS;
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float4 ScreenPosNorm = float4( posInput.positionNDC, packedInput.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, packedInput.positionCS.z ) * packedInput.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos, _ProjectionParams.x );

				float2 appendResult209 = (float2(_Tilingandoffset.x , _Tilingandoffset.y));
				float2 appendResult210 = (float2(_Tilingandoffset.z , _Tilingandoffset.w));
				float2 texCoord88 = packedInput.ase_texcoord1.xy * appendResult209 + appendResult210;
				float2 appendResult219 = (float2(_TilingandoffsetDistortion.x , _TilingandoffsetDistortion.y));
				float2 appendResult220 = (float2(_TilingandoffsetDistortion.z , _TilingandoffsetDistortion.w));
				float2 texCoord217 = packedInput.ase_texcoord1.xy * appendResult219 + appendResult220;
				float2 panner212 = ( 1.0 * _Time.y * _ScrollingSpeedDistortion + texCoord217);
				float3 ase_positionWS = GetAbsolutePositionWS( PositionRWS );
				float2 appendResult388 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult392 = lerp( panner212 , ( appendResult388 / _WorldpositionDistortionUVscale ) , _WorldpositionDistortion);
				float2 appendResult222 = (float2(1.0 , 1.0));
				float clampResult416 = clamp( ( 1.0 - packedInput.ase_color.a ) , 0.0001 , 1.0 );
				float lerpResult290 = lerp( 1.0 , pow( clampResult416 , _DistortionAlphapower ) , _Distortioninfluencedbyalpha);
				float2 temp_output_223_0 = ( ( tex2D( _DistortionTexture, lerpResult392 ).r - 0.5 ) * appendResult222 * _DistortionIntensity * saturate( lerpResult290 ) );
				float2 texCoord230 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break4_g96 = ( ( texCoord230 - _PolarUVCenter ) * float2( 2,2 ) );
				float temp_output_29_0_g95 = sqrt( ( ( break4_g96.x * break4_g96.x ) + ( break4_g96.y * break4_g96.y ) ) );
				float lerpResult9_g95 = lerp( _Twistcenter , _TwistEdges , temp_output_29_0_g95);
				float2 appendResult10_g95 = (float2(( ( ( atan2( break4_g96.y , break4_g96.x ) / TWO_PI ) + 0.5 ) + lerpResult9_g95 ) , pow( temp_output_29_0_g95 , _PolarpowerV )));
				float2 break17_g95 = appendResult10_g95;
				float2 appendResult22_g95 = (float2(( break17_g95.x * floor( _PolartilingU ) ) , ( _PolartilingV * break17_g95.y )));
				float2 lerpResult125 = lerp( ( texCoord88 + temp_output_223_0 ) , ( ( appendResult22_g95 + temp_output_223_0 ) * appendResult209 ) , _PolarUV);
				float2 panner97 = ( 1.0 * _Time.y * _ScrollingSpeed + lerpResult125);
				float2 appendResult382 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult380 = lerp( panner97 , ( appendResult382 / _WorldpositionUVscale ) , _WorldpositionMainTexture);
				float4 tex2DNode13 = tex2D( _MainTex, ( lerpResult380 + ( float2( -1,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) );
				float4 appendResult408 = (float4(tex2DNode13.r , tex2D( _MainTex, ( lerpResult380 + ( float2( 0,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) ).g , tex2D( _MainTex, ( lerpResult380 + ( float2( 1,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) ).b , tex2DNode13.a));
				float4 temp_cast_0 = (1.0).xxxx;
				float temp_output_17_0_g92 = _Channelusedasalpha;
				float4 lerpResult94 = lerp( appendResult408 , temp_cast_0 , step( temp_output_17_0_g92 , 2.9 ));
				float4 temp_output_13_0_g92 = appendResult408;
				float4 break15_g92 = temp_output_13_0_g92;
				float lerpResult4_g92 = lerp( break15_g92.r , break15_g92.g , temp_output_17_0_g92);
				float lerpResult5_g92 = lerp( lerpResult4_g92 , break15_g92.b , saturate( ( temp_output_17_0_g92 + -1.0 ) ));
				float lerpResult7_g92 = lerp( lerpResult5_g92 , break15_g92.a , saturate( ( temp_output_17_0_g92 + -2.0 ) ));
				float4 temp_cast_3 = (lerpResult7_g92).xxxx;
				float4 lerpResult8_g92 = lerp( temp_cast_3 , temp_output_13_0_g92 , saturate( ( temp_output_17_0_g92 + -3.0 ) ));
				float4 temp_output_411_0 = lerpResult8_g92;
				float2 texCoord2_g85 = packedInput.ase_texcoord1.xy * _RadialGradienttiling + float2( 0,0 );
				float temp_output_4_0_g85 = length(  (float2( -1,-1 ) + ( fmod( texCoord2_g85 , float2( 1,1 ) ) - float2( 0,0 ) ) * ( float2( 1,1 ) - float2( -1,-1 ) ) / ( float2( 1,1 ) - float2( 0,0 ) ) ) );
				float clampResult6_g85 = clamp( temp_output_4_0_g85 , 0.0 , 1.0 );
				float3 temp_cast_4 = (temp_output_4_0_g85).xxx;
				float3 temp_cast_5 = (temp_output_4_0_g85).xxx;
				float3 linearToGamma12_g85 = FastLinearToSRGB( temp_cast_5 );
				float lerpResult373 = lerp( clampResult6_g85 , linearToGamma12_g85.x , _RadialGradientingammaspace);
				float lerpResult86 = lerp( 1.0 , pow( saturate( ( 1.0 - pow( lerpResult373 , _RedialGradientPower ) ) ) , _RedialGradientinvertedPower ) , _RadialGradient);
				float temp_output_239_0 = saturate( lerpResult86 );
				float2 texCoord325 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult357 = lerp( 1.0 , pow( ( saturate( ( texCoord325.x / _GradientpositifU ) ) * saturate( ( ( 1.0 - texCoord325.x ) / _GradientnegatifU ) ) * saturate( ( texCoord325.y / _GradientpositifV ) ) * saturate( ( ( 1.0 - texCoord325.y ) / _GradientnegatifV ) ) ) , _LinearGradientpower ) , _LinearGradients);
				float temp_output_16_0_g86 = ( 1.0 - saturate( ( ( 1.0 - pow( ( 1.0 - packedInput.ase_color.a ) , _AlphaErosionPower ) ) * temp_output_239_0 * lerpResult357 ) ) );
				float temp_output_3_0_g86 = ( saturate( temp_output_411_0.r ) - temp_output_16_0_g86 );
				float4 temp_cast_7 = (saturate( temp_output_3_0_g86 )).xxxx;
				float4 lerpResult76 = lerp( ( temp_output_411_0 * ( pow( packedInput.ase_color.a , _CompensateFadingExposure ) * temp_output_239_0 * lerpResult357 ) ) , temp_cast_7 , _AlphaErosion);
				float screenDepth40 = LinearEyeDepth(SampleCameraDepth( ScreenPosNorm.xy ),_ZBufferParams);
				float distanceDepth40 = abs( ( screenDepth40 - LinearEyeDepth( ScreenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float lerpResult89 = lerp( 1.0 , pow( saturate( distanceDepth40 ) , 3.0 ) , _DepthFade);
				float temp_output_317_0 = saturate( lerpResult89 );
				float lerpResult266 = lerp( temp_output_317_0 , ( ( 1.0 - temp_output_317_0 ) * _InverseDepthfadeintensity ) , _InverseDepthfade);
				float4 temp_output_84_0 = ( lerpResult76 * lerpResult266 );
				float4 lerpResult313 = lerp( ( _Color * lerpResult94 * packedInput.ase_color ) , tex2D( _ColorGradient, ( 1.0 - saturate( ( temp_output_84_0 * _ColorGradientadjust ) ) ).rg ) , _UseGradientascolor);
				float3 hdEmission168 = ASEGetEmissionHDRColor(lerpResult313.rgb,_Intensity,1.0,GetInverseCurrentExposureMultiplier());
				float3 temp_cast_10 = (0.0).xxx;
				float3 temp_cast_11 = (1E+07).xxx;
				float3 clampResult417 = clamp( hdEmission168 , temp_cast_10 , temp_cast_11 );
				
				float2 texCoord297 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_302_0 = ( texCoord297.x + ( ( packedInput.ase_color.a * 2.0 ) + -1.0 ) );
				float lerpResult306 = lerp( 1.0 , saturate( ( ( 1.0 - temp_output_302_0 ) * temp_output_302_0 * 4.0 ) ) , _Trail);
				float4 temp_output_316_0 = saturate( ( ( temp_output_84_0 * _Alpha ) * lerpResult306 ) );
				float4 lerpResult423 = lerp( temp_output_316_0 , ( temp_output_316_0 * ( _Global_Admech_View + _Global_Necron_View ) ) , _onlyinNoosphere);
				float lerpResult430 = lerp( 1.0 , ( step( _Activeforfaction , ( _Global_Faction + 0.1 ) ) * ( 1.0 - step( _Activeforfaction , ( _Global_Faction - 0.1 ) ) ) ) , _AppearsonlyforspecificFaction);
				

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				surfaceDescription.Color = clampResult417;
				surfaceDescription.Emission = 0;
				surfaceDescription.Alpha = ( lerpResult423 * lerpResult430 ).r;
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				surfaceDescription.ShadowTint = float4( 0, 0 ,0 ,1 );
				float2 Distortion = float2 ( 0, 0 );
				float DistortionBlur = 0;

				#ifdef ASE_DEPTH_WRITE_ON
				posInput.deviceDepth = input.positionSS.z;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData( input.positionSS.xy, surfaceData );

				#if defined(_ENABLE_SHADOW_MATTE)
				bsdfData.color *= GetScreenSpaceAmbientOcclusion(input.positionSS.xy);
				#endif


			#ifdef DEBUG_DISPLAY
				if (_DebugLightingMode >= DEBUGLIGHTINGMODE_DIFFUSE_LIGHTING && _DebugLightingMode <= DEBUGLIGHTINGMODE_EMISSIVE_LIGHTING)
				{
					if (_DebugLightingMode != DEBUGLIGHTINGMODE_EMISSIVE_LIGHTING)
					{
						builtinData.emissiveColor = 0.0;
					}
					else
					{
						bsdfData.color = 0.0;
					}
				}
			#endif

				float4 outResult = ApplyBlendMode(bsdfData.color * GetDeExposureMultiplier() + builtinData.emissiveColor * GetCurrentExposureMultiplier(), builtinData.opacity);
				outResult = EvaluateAtmosphericScattering(posInput, V, outResult);

				#ifdef DEBUG_DISPLAY
					int bufferSize = int(_DebugViewMaterialArray[0].x);
					for (int index = 1; index <= bufferSize; index++)
					{
						int indexMaterialProperty = int(_DebugViewMaterialArray[index].x);
						if (indexMaterialProperty != 0)
						{
							float3 result = float3(1.0, 0.0, 1.0);
							bool needLinearToSRGB = false;

							GetPropertiesDataDebug(indexMaterialProperty, result, needLinearToSRGB);
							GetVaryingsDataDebug(indexMaterialProperty, input, result, needLinearToSRGB);
							GetBuiltinDataDebug(indexMaterialProperty, builtinData, posInput, result, needLinearToSRGB);
							GetSurfaceDataDebug(indexMaterialProperty, surfaceData, result, needLinearToSRGB);
							GetBSDFDataDebug(indexMaterialProperty, bsdfData, result, needLinearToSRGB);

							if (!needLinearToSRGB)
								result = SRGBToLinear(max(0, result));

							outResult = float4(result, 1.0);
						}
					}

					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outResult = result;
					}
				#endif

				outColor = outResult;

				#if defined(_DEPTHOFFSET_ON) || defined(ASE_DEPTH_WRITE_ON)
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				outVTFeedback = builtinData.vtPackedFeedback;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ColorMask 0

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define HAVE_MESH_MODIFICATION 1
			#define ASE_VERSION 19904
			#define ASE_SRP_VERSION 170200


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

			#if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			#define SHADERPASS SHADERPASS_SHADOWS
            #define SUPPORT_GLOBAL_MIP_BIAS 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_SCREEN_POSITION_NORMALIZED


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _Color;
			float4 _Tilingandoffset;
			float4 _TilingandoffsetDistortion;
			float2 _ScrollingSpeedDistortion;
			float2 _RadialGradienttiling;
			float2 _ScrollingSpeed;
			float2 _PolarUVCenter;
			float _LinearGradients;
			float _LinearGradientpower;
			float _GradientnegatifV;
			float _Vertexoffsetsize;
			float _GradientnegatifU;
			float _GradientpositifU;
			float _RadialGradient;
			float _RedialGradientinvertedPower;
			float _GradientpositifV;
			float _AlphaErosionPower;
			float _DepthFade;
			float _DepthDistance;
			float _InverseDepthfadeintensity;
			float _InverseDepthfade;
			float _ColorGradientadjust;
			float _UseGradientascolor;
			float _Intensity;
			float _Alpha;
			float _Trail;
			float _onlyinNoosphere;
			float _AlphaErosion;
			float _RedialGradientPower;
			float _Channelusedasalpha;
			float _CompensateFadingExposure;
			float _VertexoffsetinWorldSpace;
			float _VertexOffsetintensity;
			float _VertexoffsetfromAlpha;
			float _Vertexoffsetgradient;
			float _WorldpositionDistortionUVscale;
			float _WorldpositionDistortion;
			float _DistortionIntensity;
			float _DistortionAlphapower;
			float _Distortioninfluencedbyalpha;
			float _Twistcenter;
			float _TwistEdges;
			float _PolarpowerV;
			float _PolartilingU;
			float _PolartilingV;
			float _PolarUV;
			float _WorldpositionUVscale;
			float _WorldpositionMainTexture;
			float _Chromaticabberation;
			float _Activeforfaction;
			float _RadialGradientingammaspace;
			float _AppearsonlyforspecificFaction;
			float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _EnableBlendModePreserveSpecularLighting;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _VertexoffsetTexture;
			sampler2D _MainTex;
			sampler2D _DistortionTexture;
			float _Global_Admech_View;
			float _Global_Necron_View;
			float _Global_Faction;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				#ifdef WRITE_NORMAL_BUFFER
				surfaceData.normalWS = fragInputs.tangentToWorld[2];
				#endif
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif

				#if _ALPHATEST_ON
				DoAlphaTest(surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold);
				#endif

				#if _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);

				ZERO_INITIALIZE (BuiltinData, builtinData);
				builtinData.opacity = surfaceDescription.Alpha;

				#if defined(DEBUG_DISPLAY)
					builtinData.renderingLayers = GetMeshRenderingLayerMask();
				#endif

				#ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif

                ApplyDebugToBuiltinData(builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction( AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS o;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float2 texCoord360 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float3 ase_positionWS = GetAbsolutePositionWS( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float2 appendResult363 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult361 = lerp( texCoord360 , ( appendResult363 / _Vertexoffsetsize ) , _VertexoffsetinWorldSpace);
				float lerpResult286 = lerp( 0.0 , inputMesh.ase_color.a , _VertexoffsetfromAlpha);
				float2 texCoord276 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult368 = lerp( 1.0 , ( texCoord276.x * ( 1.0 - texCoord276.x ) * 4.0 ) , _Vertexoffsetgradient);
				
				o.ase_texcoord1.xy = inputMesh.ase_texcoord.xy;
				o.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( ( tex2Dlod( _VertexoffsetTexture, float4( lerpResult361, 0, 0.0) ) + -0.5 ) * _VertexOffsetintensity * ( 1.0 - lerpResult286 ) * lerpResult368 ).rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);
				o.positionRWS = positionRWS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#ifdef WRITE_MSAA_DEPTH
						, out float4 depthColor : SV_Target0
							#ifdef WRITE_NORMAL_BUFFER
							, out float4 outNormalBuffer : SV_Target1
							#endif
						#else
							#ifdef WRITE_NORMAL_BUFFER
							, out float4 outNormalBuffer : SV_Target0
							#endif
						#endif
						#if defined(_DEPTHOFFSET_ON)
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
					
					)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 PositionRWS = packedInput.positionRWS;
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float4 ScreenPosNorm = float4( posInput.positionNDC, packedInput.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, packedInput.positionCS.z ) * packedInput.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos, _ProjectionParams.x );

				float2 appendResult209 = (float2(_Tilingandoffset.x , _Tilingandoffset.y));
				float2 appendResult210 = (float2(_Tilingandoffset.z , _Tilingandoffset.w));
				float2 texCoord88 = packedInput.ase_texcoord1.xy * appendResult209 + appendResult210;
				float2 appendResult219 = (float2(_TilingandoffsetDistortion.x , _TilingandoffsetDistortion.y));
				float2 appendResult220 = (float2(_TilingandoffsetDistortion.z , _TilingandoffsetDistortion.w));
				float2 texCoord217 = packedInput.ase_texcoord1.xy * appendResult219 + appendResult220;
				float2 panner212 = ( 1.0 * _Time.y * _ScrollingSpeedDistortion + texCoord217);
				float3 ase_positionWS = GetAbsolutePositionWS( PositionRWS );
				float2 appendResult388 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult392 = lerp( panner212 , ( appendResult388 / _WorldpositionDistortionUVscale ) , _WorldpositionDistortion);
				float2 appendResult222 = (float2(1.0 , 1.0));
				float clampResult416 = clamp( ( 1.0 - packedInput.ase_color.a ) , 0.0001 , 1.0 );
				float lerpResult290 = lerp( 1.0 , pow( clampResult416 , _DistortionAlphapower ) , _Distortioninfluencedbyalpha);
				float2 temp_output_223_0 = ( ( tex2D( _DistortionTexture, lerpResult392 ).r - 0.5 ) * appendResult222 * _DistortionIntensity * saturate( lerpResult290 ) );
				float2 texCoord230 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break4_g96 = ( ( texCoord230 - _PolarUVCenter ) * float2( 2,2 ) );
				float temp_output_29_0_g95 = sqrt( ( ( break4_g96.x * break4_g96.x ) + ( break4_g96.y * break4_g96.y ) ) );
				float lerpResult9_g95 = lerp( _Twistcenter , _TwistEdges , temp_output_29_0_g95);
				float2 appendResult10_g95 = (float2(( ( ( atan2( break4_g96.y , break4_g96.x ) / TWO_PI ) + 0.5 ) + lerpResult9_g95 ) , pow( temp_output_29_0_g95 , _PolarpowerV )));
				float2 break17_g95 = appendResult10_g95;
				float2 appendResult22_g95 = (float2(( break17_g95.x * floor( _PolartilingU ) ) , ( _PolartilingV * break17_g95.y )));
				float2 lerpResult125 = lerp( ( texCoord88 + temp_output_223_0 ) , ( ( appendResult22_g95 + temp_output_223_0 ) * appendResult209 ) , _PolarUV);
				float2 panner97 = ( 1.0 * _Time.y * _ScrollingSpeed + lerpResult125);
				float2 appendResult382 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult380 = lerp( panner97 , ( appendResult382 / _WorldpositionUVscale ) , _WorldpositionMainTexture);
				float4 tex2DNode13 = tex2D( _MainTex, ( lerpResult380 + ( float2( -1,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) );
				float4 appendResult408 = (float4(tex2DNode13.r , tex2D( _MainTex, ( lerpResult380 + ( float2( 0,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) ).g , tex2D( _MainTex, ( lerpResult380 + ( float2( 1,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) ).b , tex2DNode13.a));
				float4 temp_output_13_0_g92 = appendResult408;
				float4 break15_g92 = temp_output_13_0_g92;
				float temp_output_17_0_g92 = _Channelusedasalpha;
				float lerpResult4_g92 = lerp( break15_g92.r , break15_g92.g , temp_output_17_0_g92);
				float lerpResult5_g92 = lerp( lerpResult4_g92 , break15_g92.b , saturate( ( temp_output_17_0_g92 + -1.0 ) ));
				float lerpResult7_g92 = lerp( lerpResult5_g92 , break15_g92.a , saturate( ( temp_output_17_0_g92 + -2.0 ) ));
				float4 temp_cast_1 = (lerpResult7_g92).xxxx;
				float4 lerpResult8_g92 = lerp( temp_cast_1 , temp_output_13_0_g92 , saturate( ( temp_output_17_0_g92 + -3.0 ) ));
				float4 temp_output_411_0 = lerpResult8_g92;
				float2 texCoord2_g85 = packedInput.ase_texcoord1.xy * _RadialGradienttiling + float2( 0,0 );
				float temp_output_4_0_g85 = length(  (float2( -1,-1 ) + ( fmod( texCoord2_g85 , float2( 1,1 ) ) - float2( 0,0 ) ) * ( float2( 1,1 ) - float2( -1,-1 ) ) / ( float2( 1,1 ) - float2( 0,0 ) ) ) );
				float clampResult6_g85 = clamp( temp_output_4_0_g85 , 0.0 , 1.0 );
				float3 temp_cast_2 = (temp_output_4_0_g85).xxx;
				float3 temp_cast_3 = (temp_output_4_0_g85).xxx;
				float3 linearToGamma12_g85 = FastLinearToSRGB( temp_cast_3 );
				float lerpResult373 = lerp( clampResult6_g85 , linearToGamma12_g85.x , _RadialGradientingammaspace);
				float lerpResult86 = lerp( 1.0 , pow( saturate( ( 1.0 - pow( lerpResult373 , _RedialGradientPower ) ) ) , _RedialGradientinvertedPower ) , _RadialGradient);
				float temp_output_239_0 = saturate( lerpResult86 );
				float2 texCoord325 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult357 = lerp( 1.0 , pow( ( saturate( ( texCoord325.x / _GradientpositifU ) ) * saturate( ( ( 1.0 - texCoord325.x ) / _GradientnegatifU ) ) * saturate( ( texCoord325.y / _GradientpositifV ) ) * saturate( ( ( 1.0 - texCoord325.y ) / _GradientnegatifV ) ) ) , _LinearGradientpower ) , _LinearGradients);
				float temp_output_16_0_g86 = ( 1.0 - saturate( ( ( 1.0 - pow( ( 1.0 - packedInput.ase_color.a ) , _AlphaErosionPower ) ) * temp_output_239_0 * lerpResult357 ) ) );
				float temp_output_3_0_g86 = ( saturate( temp_output_411_0.r ) - temp_output_16_0_g86 );
				float4 temp_cast_5 = (saturate( temp_output_3_0_g86 )).xxxx;
				float4 lerpResult76 = lerp( ( temp_output_411_0 * ( pow( packedInput.ase_color.a , _CompensateFadingExposure ) * temp_output_239_0 * lerpResult357 ) ) , temp_cast_5 , _AlphaErosion);
				float screenDepth40 = LinearEyeDepth(SampleCameraDepth( ScreenPosNorm.xy ),_ZBufferParams);
				float distanceDepth40 = abs( ( screenDepth40 - LinearEyeDepth( ScreenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float lerpResult89 = lerp( 1.0 , pow( saturate( distanceDepth40 ) , 3.0 ) , _DepthFade);
				float temp_output_317_0 = saturate( lerpResult89 );
				float lerpResult266 = lerp( temp_output_317_0 , ( ( 1.0 - temp_output_317_0 ) * _InverseDepthfadeintensity ) , _InverseDepthfade);
				float4 temp_output_84_0 = ( lerpResult76 * lerpResult266 );
				float2 texCoord297 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_302_0 = ( texCoord297.x + ( ( packedInput.ase_color.a * 2.0 ) + -1.0 ) );
				float lerpResult306 = lerp( 1.0 , saturate( ( ( 1.0 - temp_output_302_0 ) * temp_output_302_0 * 4.0 ) ) , _Trail);
				float4 temp_output_316_0 = saturate( ( ( temp_output_84_0 * _Alpha ) * lerpResult306 ) );
				float4 lerpResult423 = lerp( temp_output_316_0 , ( temp_output_316_0 * ( _Global_Admech_View + _Global_Necron_View ) ) , _onlyinNoosphere);
				float lerpResult430 = lerp( 1.0 , ( step( _Activeforfaction , ( _Global_Faction + 0.1 ) ) * ( 1.0 - step( _Activeforfaction , ( _Global_Faction - 0.1 ) ) ) ) , _AppearsonlyforspecificFaction);
				

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				surfaceDescription.Alpha = ( lerpResult423 * lerpResult430 ).r;
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;

				#ifdef ASE_DEPTH_WRITE_ON
				posInput.deviceDepth = input.positionSS.z;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				#if defined(_DEPTHOFFSET_ON) || defined(ASE_DEPTH_WRITE_ON)
				outputDepth = posInput.deviceDepth;
				float bias = max(abs(ddx(posInput.deviceDepth)), abs(ddy(posInput.deviceDepth))) * _SlopeScaleDepthBias;
				outputDepth += bias;
				#endif

				#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.vmesh.positionCS.z;
					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
					DecalPrepassData decalPrepassData;
					#ifdef _DISABLE_DECALS
					ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
					#else
					decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
					#endif
					decalPrepassData.renderingLayerMask = GetMeshRenderingLayerMask();
					EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define HAVE_MESH_MODIFICATION 1
			#define ASE_VERSION 19904
			#define ASE_SRP_VERSION 170200


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma shader_feature EDITOR_VISUALIZATION

			#pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT
            #define SCENEPICKINGPASS
            #define SUPPORT_GLOBAL_MIP_BIAS 1

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			CBUFFER_START( UnityPerMaterial )
			float4 _Color;
			float4 _Tilingandoffset;
			float4 _TilingandoffsetDistortion;
			float2 _ScrollingSpeedDistortion;
			float2 _RadialGradienttiling;
			float2 _ScrollingSpeed;
			float2 _PolarUVCenter;
			float _LinearGradients;
			float _LinearGradientpower;
			float _GradientnegatifV;
			float _Vertexoffsetsize;
			float _GradientnegatifU;
			float _GradientpositifU;
			float _RadialGradient;
			float _RedialGradientinvertedPower;
			float _GradientpositifV;
			float _AlphaErosionPower;
			float _DepthFade;
			float _DepthDistance;
			float _InverseDepthfadeintensity;
			float _InverseDepthfade;
			float _ColorGradientadjust;
			float _UseGradientascolor;
			float _Intensity;
			float _Alpha;
			float _Trail;
			float _onlyinNoosphere;
			float _AlphaErosion;
			float _RedialGradientPower;
			float _Channelusedasalpha;
			float _CompensateFadingExposure;
			float _VertexoffsetinWorldSpace;
			float _VertexOffsetintensity;
			float _VertexoffsetfromAlpha;
			float _Vertexoffsetgradient;
			float _WorldpositionDistortionUVscale;
			float _WorldpositionDistortion;
			float _DistortionIntensity;
			float _DistortionAlphapower;
			float _Distortioninfluencedbyalpha;
			float _Twistcenter;
			float _TwistEdges;
			float _PolarpowerV;
			float _PolartilingU;
			float _PolartilingV;
			float _PolarUV;
			float _WorldpositionUVscale;
			float _WorldpositionMainTexture;
			float _Chromaticabberation;
			float _Activeforfaction;
			float _RadialGradientingammaspace;
			float _AppearsonlyforspecificFaction;
			float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _EnableBlendModePreserveSpecularLighting;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _VertexoffsetTexture;
			sampler2D _MainTex;
			sampler2D _DistortionTexture;
			sampler2D _ColorGradient;
			float _Global_Admech_View;
			float _Global_Necron_View;
			float _Global_Faction;


            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_COLOR


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				#ifdef EDITOR_VISUALIZATION
				float2 VizUV : TEXCOORD0;
				float4 LightCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};


			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			struct SurfaceDescription
			{
				float3 Color;
				float3 Emission;
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData( FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData )
			{
				ZERO_INITIALIZE( SurfaceData, surfaceData );
				surfaceData.color = surfaceDescription.Color;

				#ifdef WRITE_NORMAL_BUFFER
				surfaceData.normalWS = fragInputs.tangentToWorld[2];
				#endif
			}

			void GetSurfaceAndBuiltinData( SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData )
			{
				#ifdef LOD_FADE_CROSSFADE
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif

				#if _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#if _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData );
				ZERO_INITIALIZE( BuiltinData, builtinData );
				builtinData.opacity = surfaceDescription.Alpha;
				#if defined(DEBUG_DISPLAY)
					builtinData.renderingLayers = GetMeshRenderingLayerMask();
				#endif

				#ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				#if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif


                ApplyDebugToBuiltinData(builtinData);
			}

			#define SCENEPICKINGPASS
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/MetaPass.hlsl"

			PackedVaryingsMeshToPS VertexFunction( AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS o;
				UNITY_SETUP_INSTANCE_ID( inputMesh );
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, o );

				float2 texCoord360 = inputMesh.uv0.xy * float2( 1,1 ) + float2( 0,0 );
				float3 ase_positionWS = GetAbsolutePositionWS( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float2 appendResult363 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult361 = lerp( texCoord360 , ( appendResult363 / _Vertexoffsetsize ) , _VertexoffsetinWorldSpace);
				float lerpResult286 = lerp( 0.0 , inputMesh.ase_color.a , _VertexoffsetfromAlpha);
				float2 texCoord276 = inputMesh.uv0.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult368 = lerp( 1.0 , ( texCoord276.x * ( 1.0 - texCoord276.x ) * 4.0 ) , _Vertexoffsetgradient);
				
				o.ase_texcoord3.xyz = ase_positionWS;
				float4 ase_positionCS = TransformWorldToHClip( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float4 screenPos = ComputeScreenPos( ase_positionCS, _ProjectionParams.x );
				o.ase_texcoord4 = screenPos;
				
				o.ase_texcoord2.xy = inputMesh.uv0.xy;
				o.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( ( tex2Dlod( _VertexoffsetTexture, float4( lerpResult361, 0, 0.0) ) + -0.5 ) * _VertexOffsetintensity * ( 1.0 - lerpResult286 ) * lerpResult368 ).rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

			#ifdef EDITOR_VISUALIZATION
				float2 vizUV = 0;
				float4 lightCoord = 0;
				UnityEditorVizData(inputMesh.positionOS.xyz, inputMesh.uv0.xy, inputMesh.uv1.xy, inputMesh.uv2.xy, vizUV, lightCoord);
			#endif

				float2 uv = float2( 0.0, 0.0 );
				if( unity_MetaVertexControl.x )
				{
					uv = inputMesh.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				}
				else if( unity_MetaVertexControl.y )
				{
					uv = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				}

				#ifdef EDITOR_VISUALIZATION
					o.VizUV.xy = vizUV;
					o.LightCoord = lightCoord;
				#endif

				o.positionCS = float4( uv * 2.0 - 1.0, inputMesh.positionOS.z > 0 ? 1.0e-4 : 0.0, 1.0 );
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.uv0 = v.uv0;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.uv3 = v.uv3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.uv0 = patch[0].uv0 * bary.x + patch[1].uv0 * bary.y + patch[2].uv0 * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.uv3 = patch[0].uv3 * bary.x + patch[1].uv3 * bary.y + patch[2].uv3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag( PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE( FragInputs, input );
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );

				float3 V = float3( 1.0, 1.0, 1.0 );

				float2 appendResult209 = (float2(_Tilingandoffset.x , _Tilingandoffset.y));
				float2 appendResult210 = (float2(_Tilingandoffset.z , _Tilingandoffset.w));
				float2 texCoord88 = packedInput.ase_texcoord2.xy * appendResult209 + appendResult210;
				float2 appendResult219 = (float2(_TilingandoffsetDistortion.x , _TilingandoffsetDistortion.y));
				float2 appendResult220 = (float2(_TilingandoffsetDistortion.z , _TilingandoffsetDistortion.w));
				float2 texCoord217 = packedInput.ase_texcoord2.xy * appendResult219 + appendResult220;
				float2 panner212 = ( 1.0 * _Time.y * _ScrollingSpeedDistortion + texCoord217);
				float3 ase_positionWS = packedInput.ase_texcoord3.xyz;
				float2 appendResult388 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult392 = lerp( panner212 , ( appendResult388 / _WorldpositionDistortionUVscale ) , _WorldpositionDistortion);
				float2 appendResult222 = (float2(1.0 , 1.0));
				float clampResult416 = clamp( ( 1.0 - packedInput.ase_color.a ) , 0.0001 , 1.0 );
				float lerpResult290 = lerp( 1.0 , pow( clampResult416 , _DistortionAlphapower ) , _Distortioninfluencedbyalpha);
				float2 temp_output_223_0 = ( ( tex2D( _DistortionTexture, lerpResult392 ).r - 0.5 ) * appendResult222 * _DistortionIntensity * saturate( lerpResult290 ) );
				float2 texCoord230 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break4_g96 = ( ( texCoord230 - _PolarUVCenter ) * float2( 2,2 ) );
				float temp_output_29_0_g95 = sqrt( ( ( break4_g96.x * break4_g96.x ) + ( break4_g96.y * break4_g96.y ) ) );
				float lerpResult9_g95 = lerp( _Twistcenter , _TwistEdges , temp_output_29_0_g95);
				float2 appendResult10_g95 = (float2(( ( ( atan2( break4_g96.y , break4_g96.x ) / TWO_PI ) + 0.5 ) + lerpResult9_g95 ) , pow( temp_output_29_0_g95 , _PolarpowerV )));
				float2 break17_g95 = appendResult10_g95;
				float2 appendResult22_g95 = (float2(( break17_g95.x * floor( _PolartilingU ) ) , ( _PolartilingV * break17_g95.y )));
				float2 lerpResult125 = lerp( ( texCoord88 + temp_output_223_0 ) , ( ( appendResult22_g95 + temp_output_223_0 ) * appendResult209 ) , _PolarUV);
				float2 panner97 = ( 1.0 * _Time.y * _ScrollingSpeed + lerpResult125);
				float2 appendResult382 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult380 = lerp( panner97 , ( appendResult382 / _WorldpositionUVscale ) , _WorldpositionMainTexture);
				float4 tex2DNode13 = tex2D( _MainTex, ( lerpResult380 + ( float2( -1,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) );
				float4 appendResult408 = (float4(tex2DNode13.r , tex2D( _MainTex, ( lerpResult380 + ( float2( 0,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) ).g , tex2D( _MainTex, ( lerpResult380 + ( float2( 1,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) ).b , tex2DNode13.a));
				float4 temp_cast_0 = (1.0).xxxx;
				float temp_output_17_0_g92 = _Channelusedasalpha;
				float4 lerpResult94 = lerp( appendResult408 , temp_cast_0 , step( temp_output_17_0_g92 , 2.9 ));
				float4 temp_output_13_0_g92 = appendResult408;
				float4 break15_g92 = temp_output_13_0_g92;
				float lerpResult4_g92 = lerp( break15_g92.r , break15_g92.g , temp_output_17_0_g92);
				float lerpResult5_g92 = lerp( lerpResult4_g92 , break15_g92.b , saturate( ( temp_output_17_0_g92 + -1.0 ) ));
				float lerpResult7_g92 = lerp( lerpResult5_g92 , break15_g92.a , saturate( ( temp_output_17_0_g92 + -2.0 ) ));
				float4 temp_cast_3 = (lerpResult7_g92).xxxx;
				float4 lerpResult8_g92 = lerp( temp_cast_3 , temp_output_13_0_g92 , saturate( ( temp_output_17_0_g92 + -3.0 ) ));
				float4 temp_output_411_0 = lerpResult8_g92;
				float2 texCoord2_g85 = packedInput.ase_texcoord2.xy * _RadialGradienttiling + float2( 0,0 );
				float temp_output_4_0_g85 = length(  (float2( -1,-1 ) + ( fmod( texCoord2_g85 , float2( 1,1 ) ) - float2( 0,0 ) ) * ( float2( 1,1 ) - float2( -1,-1 ) ) / ( float2( 1,1 ) - float2( 0,0 ) ) ) );
				float clampResult6_g85 = clamp( temp_output_4_0_g85 , 0.0 , 1.0 );
				float3 temp_cast_4 = (temp_output_4_0_g85).xxx;
				float3 temp_cast_5 = (temp_output_4_0_g85).xxx;
				float3 linearToGamma12_g85 = FastLinearToSRGB( temp_cast_5 );
				float lerpResult373 = lerp( clampResult6_g85 , linearToGamma12_g85.x , _RadialGradientingammaspace);
				float lerpResult86 = lerp( 1.0 , pow( saturate( ( 1.0 - pow( lerpResult373 , _RedialGradientPower ) ) ) , _RedialGradientinvertedPower ) , _RadialGradient);
				float temp_output_239_0 = saturate( lerpResult86 );
				float2 texCoord325 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult357 = lerp( 1.0 , pow( ( saturate( ( texCoord325.x / _GradientpositifU ) ) * saturate( ( ( 1.0 - texCoord325.x ) / _GradientnegatifU ) ) * saturate( ( texCoord325.y / _GradientpositifV ) ) * saturate( ( ( 1.0 - texCoord325.y ) / _GradientnegatifV ) ) ) , _LinearGradientpower ) , _LinearGradients);
				float temp_output_16_0_g86 = ( 1.0 - saturate( ( ( 1.0 - pow( ( 1.0 - packedInput.ase_color.a ) , _AlphaErosionPower ) ) * temp_output_239_0 * lerpResult357 ) ) );
				float temp_output_3_0_g86 = ( saturate( temp_output_411_0.r ) - temp_output_16_0_g86 );
				float4 temp_cast_7 = (saturate( temp_output_3_0_g86 )).xxxx;
				float4 lerpResult76 = lerp( ( temp_output_411_0 * ( pow( packedInput.ase_color.a , _CompensateFadingExposure ) * temp_output_239_0 * lerpResult357 ) ) , temp_cast_7 , _AlphaErosion);
				float4 screenPos = packedInput.ase_texcoord4;
				float4 ase_positionSSNorm = screenPos / screenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float screenDepth40 = LinearEyeDepth(SampleCameraDepth( ase_positionSSNorm.xy ),_ZBufferParams);
				float distanceDepth40 = abs( ( screenDepth40 - LinearEyeDepth( ase_positionSSNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float lerpResult89 = lerp( 1.0 , pow( saturate( distanceDepth40 ) , 3.0 ) , _DepthFade);
				float temp_output_317_0 = saturate( lerpResult89 );
				float lerpResult266 = lerp( temp_output_317_0 , ( ( 1.0 - temp_output_317_0 ) * _InverseDepthfadeintensity ) , _InverseDepthfade);
				float4 temp_output_84_0 = ( lerpResult76 * lerpResult266 );
				float4 lerpResult313 = lerp( ( _Color * lerpResult94 * packedInput.ase_color ) , tex2D( _ColorGradient, ( 1.0 - saturate( ( temp_output_84_0 * _ColorGradientadjust ) ) ).rg ) , _UseGradientascolor);
				float3 hdEmission168 = ASEGetEmissionHDRColor(lerpResult313.rgb,_Intensity,1.0,GetInverseCurrentExposureMultiplier());
				float3 temp_cast_10 = (0.0).xxx;
				float3 temp_cast_11 = (1E+07).xxx;
				float3 clampResult417 = clamp( hdEmission168 , temp_cast_10 , temp_cast_11 );
				
				float2 texCoord297 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_302_0 = ( texCoord297.x + ( ( packedInput.ase_color.a * 2.0 ) + -1.0 ) );
				float lerpResult306 = lerp( 1.0 , saturate( ( ( 1.0 - temp_output_302_0 ) * temp_output_302_0 * 4.0 ) ) , _Trail);
				float4 temp_output_316_0 = saturate( ( ( temp_output_84_0 * _Alpha ) * lerpResult306 ) );
				float4 lerpResult423 = lerp( temp_output_316_0 , ( temp_output_316_0 * ( _Global_Admech_View + _Global_Necron_View ) ) , _onlyinNoosphere);
				float lerpResult430 = lerp( 1.0 , ( step( _Activeforfaction , ( _Global_Faction + 0.1 ) ) * ( 1.0 - step( _Activeforfaction , ( _Global_Faction - 0.1 ) ) ) ) , _AppearsonlyforspecificFaction);
				

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				surfaceDescription.Color = clampResult417;
				surfaceDescription.Emission = 0;
				surfaceDescription.Alpha = ( lerpResult423 * lerpResult430 ).r;
				surfaceDescription.AlphaClipThreshold =  _AlphaCutoff;

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData( surfaceDescription,input, V, posInput, surfaceData, builtinData );

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData( input.positionSS.xy, surfaceData );
				LightTransportData lightTransportData = GetLightTransportData( surfaceData, builtinData, bsdfData );

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				UnityMetaInput metaInput;
				metaInput.Albedo = lightTransportData.diffuseColor.rgb;
				metaInput.Emission = lightTransportData.emissiveColor;
			#ifdef EDITOR_VISUALIZATION
				metaInput.VizUV = packedInput.VizUV;
				metaInput.LightCoord = packedInput.LightCoord;
			#endif
				res = UnityMetaFragment(metaInput);

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define HAVE_MESH_MODIFICATION 1
			#define ASE_VERSION 19904
			#define ASE_SRP_VERSION 170200


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma editor_sync_compilation

			#pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENESELECTIONPASS 1
            #define SUPPORT_GLOBAL_MIP_BIAS 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			int _ObjectId;
			int _PassValue;

			CBUFFER_START( UnityPerMaterial )
			float4 _Color;
			float4 _Tilingandoffset;
			float4 _TilingandoffsetDistortion;
			float2 _ScrollingSpeedDistortion;
			float2 _RadialGradienttiling;
			float2 _ScrollingSpeed;
			float2 _PolarUVCenter;
			float _LinearGradients;
			float _LinearGradientpower;
			float _GradientnegatifV;
			float _Vertexoffsetsize;
			float _GradientnegatifU;
			float _GradientpositifU;
			float _RadialGradient;
			float _RedialGradientinvertedPower;
			float _GradientpositifV;
			float _AlphaErosionPower;
			float _DepthFade;
			float _DepthDistance;
			float _InverseDepthfadeintensity;
			float _InverseDepthfade;
			float _ColorGradientadjust;
			float _UseGradientascolor;
			float _Intensity;
			float _Alpha;
			float _Trail;
			float _onlyinNoosphere;
			float _AlphaErosion;
			float _RedialGradientPower;
			float _Channelusedasalpha;
			float _CompensateFadingExposure;
			float _VertexoffsetinWorldSpace;
			float _VertexOffsetintensity;
			float _VertexoffsetfromAlpha;
			float _Vertexoffsetgradient;
			float _WorldpositionDistortionUVscale;
			float _WorldpositionDistortion;
			float _DistortionIntensity;
			float _DistortionAlphapower;
			float _Distortioninfluencedbyalpha;
			float _Twistcenter;
			float _TwistEdges;
			float _PolarpowerV;
			float _PolartilingU;
			float _PolartilingV;
			float _PolarUV;
			float _WorldpositionUVscale;
			float _WorldpositionMainTexture;
			float _Chromaticabberation;
			float _Activeforfaction;
			float _RadialGradientingammaspace;
			float _AppearsonlyforspecificFaction;
			float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _EnableBlendModePreserveSpecularLighting;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _VertexoffsetTexture;
			sampler2D _MainTex;
			sampler2D _DistortionTexture;
			float _Global_Admech_View;
			float _Global_Necron_View;
			float _Global_Faction;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_COLOR


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};


			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				#ifdef WRITE_NORMAL_BUFFER
				surfaceData.normalWS = fragInputs.tangentToWorld[2];
				#endif
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif

				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);
				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity =  surfaceDescription.Alpha;

				#ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif


                ApplyDebugToBuiltinData(builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction( AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS o;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float2 texCoord360 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float3 ase_positionWS = GetAbsolutePositionWS( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float2 appendResult363 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult361 = lerp( texCoord360 , ( appendResult363 / _Vertexoffsetsize ) , _VertexoffsetinWorldSpace);
				float lerpResult286 = lerp( 0.0 , inputMesh.ase_color.a , _VertexoffsetfromAlpha);
				float2 texCoord276 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult368 = lerp( 1.0 , ( texCoord276.x * ( 1.0 - texCoord276.x ) * 4.0 ) , _Vertexoffsetgradient);
				
				o.ase_texcoord1.xyz = ase_positionWS;
				float4 ase_positionCS = TransformWorldToHClip( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float4 screenPos = ComputeScreenPos( ase_positionCS, _ProjectionParams.x );
				o.ase_texcoord2 = screenPos;
				
				o.ase_texcoord.xy = inputMesh.ase_texcoord.xy;
				o.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  ( ( tex2Dlod( _VertexoffsetTexture, float4( lerpResult361, 0, 0.0) ) + -0.5 ) * _VertexOffsetintensity * ( 1.0 - lerpResult286 ) * lerpResult368 ).rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
					, out float4 outColor : SV_Target0
					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
					#endif
					
					)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = float3( 1.0, 1.0, 1.0 );

				float2 appendResult209 = (float2(_Tilingandoffset.x , _Tilingandoffset.y));
				float2 appendResult210 = (float2(_Tilingandoffset.z , _Tilingandoffset.w));
				float2 texCoord88 = packedInput.ase_texcoord.xy * appendResult209 + appendResult210;
				float2 appendResult219 = (float2(_TilingandoffsetDistortion.x , _TilingandoffsetDistortion.y));
				float2 appendResult220 = (float2(_TilingandoffsetDistortion.z , _TilingandoffsetDistortion.w));
				float2 texCoord217 = packedInput.ase_texcoord.xy * appendResult219 + appendResult220;
				float2 panner212 = ( 1.0 * _Time.y * _ScrollingSpeedDistortion + texCoord217);
				float3 ase_positionWS = packedInput.ase_texcoord1.xyz;
				float2 appendResult388 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult392 = lerp( panner212 , ( appendResult388 / _WorldpositionDistortionUVscale ) , _WorldpositionDistortion);
				float2 appendResult222 = (float2(1.0 , 1.0));
				float clampResult416 = clamp( ( 1.0 - packedInput.ase_color.a ) , 0.0001 , 1.0 );
				float lerpResult290 = lerp( 1.0 , pow( clampResult416 , _DistortionAlphapower ) , _Distortioninfluencedbyalpha);
				float2 temp_output_223_0 = ( ( tex2D( _DistortionTexture, lerpResult392 ).r - 0.5 ) * appendResult222 * _DistortionIntensity * saturate( lerpResult290 ) );
				float2 texCoord230 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break4_g96 = ( ( texCoord230 - _PolarUVCenter ) * float2( 2,2 ) );
				float temp_output_29_0_g95 = sqrt( ( ( break4_g96.x * break4_g96.x ) + ( break4_g96.y * break4_g96.y ) ) );
				float lerpResult9_g95 = lerp( _Twistcenter , _TwistEdges , temp_output_29_0_g95);
				float2 appendResult10_g95 = (float2(( ( ( atan2( break4_g96.y , break4_g96.x ) / TWO_PI ) + 0.5 ) + lerpResult9_g95 ) , pow( temp_output_29_0_g95 , _PolarpowerV )));
				float2 break17_g95 = appendResult10_g95;
				float2 appendResult22_g95 = (float2(( break17_g95.x * floor( _PolartilingU ) ) , ( _PolartilingV * break17_g95.y )));
				float2 lerpResult125 = lerp( ( texCoord88 + temp_output_223_0 ) , ( ( appendResult22_g95 + temp_output_223_0 ) * appendResult209 ) , _PolarUV);
				float2 panner97 = ( 1.0 * _Time.y * _ScrollingSpeed + lerpResult125);
				float2 appendResult382 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult380 = lerp( panner97 , ( appendResult382 / _WorldpositionUVscale ) , _WorldpositionMainTexture);
				float4 tex2DNode13 = tex2D( _MainTex, ( lerpResult380 + ( float2( -1,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) );
				float4 appendResult408 = (float4(tex2DNode13.r , tex2D( _MainTex, ( lerpResult380 + ( float2( 0,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) ).g , tex2D( _MainTex, ( lerpResult380 + ( float2( 1,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) ).b , tex2DNode13.a));
				float4 temp_output_13_0_g92 = appendResult408;
				float4 break15_g92 = temp_output_13_0_g92;
				float temp_output_17_0_g92 = _Channelusedasalpha;
				float lerpResult4_g92 = lerp( break15_g92.r , break15_g92.g , temp_output_17_0_g92);
				float lerpResult5_g92 = lerp( lerpResult4_g92 , break15_g92.b , saturate( ( temp_output_17_0_g92 + -1.0 ) ));
				float lerpResult7_g92 = lerp( lerpResult5_g92 , break15_g92.a , saturate( ( temp_output_17_0_g92 + -2.0 ) ));
				float4 temp_cast_1 = (lerpResult7_g92).xxxx;
				float4 lerpResult8_g92 = lerp( temp_cast_1 , temp_output_13_0_g92 , saturate( ( temp_output_17_0_g92 + -3.0 ) ));
				float4 temp_output_411_0 = lerpResult8_g92;
				float2 texCoord2_g85 = packedInput.ase_texcoord.xy * _RadialGradienttiling + float2( 0,0 );
				float temp_output_4_0_g85 = length(  (float2( -1,-1 ) + ( fmod( texCoord2_g85 , float2( 1,1 ) ) - float2( 0,0 ) ) * ( float2( 1,1 ) - float2( -1,-1 ) ) / ( float2( 1,1 ) - float2( 0,0 ) ) ) );
				float clampResult6_g85 = clamp( temp_output_4_0_g85 , 0.0 , 1.0 );
				float3 temp_cast_2 = (temp_output_4_0_g85).xxx;
				float3 temp_cast_3 = (temp_output_4_0_g85).xxx;
				float3 linearToGamma12_g85 = FastLinearToSRGB( temp_cast_3 );
				float lerpResult373 = lerp( clampResult6_g85 , linearToGamma12_g85.x , _RadialGradientingammaspace);
				float lerpResult86 = lerp( 1.0 , pow( saturate( ( 1.0 - pow( lerpResult373 , _RedialGradientPower ) ) ) , _RedialGradientinvertedPower ) , _RadialGradient);
				float temp_output_239_0 = saturate( lerpResult86 );
				float2 texCoord325 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult357 = lerp( 1.0 , pow( ( saturate( ( texCoord325.x / _GradientpositifU ) ) * saturate( ( ( 1.0 - texCoord325.x ) / _GradientnegatifU ) ) * saturate( ( texCoord325.y / _GradientpositifV ) ) * saturate( ( ( 1.0 - texCoord325.y ) / _GradientnegatifV ) ) ) , _LinearGradientpower ) , _LinearGradients);
				float temp_output_16_0_g86 = ( 1.0 - saturate( ( ( 1.0 - pow( ( 1.0 - packedInput.ase_color.a ) , _AlphaErosionPower ) ) * temp_output_239_0 * lerpResult357 ) ) );
				float temp_output_3_0_g86 = ( saturate( temp_output_411_0.r ) - temp_output_16_0_g86 );
				float4 temp_cast_5 = (saturate( temp_output_3_0_g86 )).xxxx;
				float4 lerpResult76 = lerp( ( temp_output_411_0 * ( pow( packedInput.ase_color.a , _CompensateFadingExposure ) * temp_output_239_0 * lerpResult357 ) ) , temp_cast_5 , _AlphaErosion);
				float4 screenPos = packedInput.ase_texcoord2;
				float4 ase_positionSSNorm = screenPos / screenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float screenDepth40 = LinearEyeDepth(SampleCameraDepth( ase_positionSSNorm.xy ),_ZBufferParams);
				float distanceDepth40 = abs( ( screenDepth40 - LinearEyeDepth( ase_positionSSNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float lerpResult89 = lerp( 1.0 , pow( saturate( distanceDepth40 ) , 3.0 ) , _DepthFade);
				float temp_output_317_0 = saturate( lerpResult89 );
				float lerpResult266 = lerp( temp_output_317_0 , ( ( 1.0 - temp_output_317_0 ) * _InverseDepthfadeintensity ) , _InverseDepthfade);
				float4 temp_output_84_0 = ( lerpResult76 * lerpResult266 );
				float2 texCoord297 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_302_0 = ( texCoord297.x + ( ( packedInput.ase_color.a * 2.0 ) + -1.0 ) );
				float lerpResult306 = lerp( 1.0 , saturate( ( ( 1.0 - temp_output_302_0 ) * temp_output_302_0 * 4.0 ) ) , _Trail);
				float4 temp_output_316_0 = saturate( ( ( temp_output_84_0 * _Alpha ) * lerpResult306 ) );
				float4 lerpResult423 = lerp( temp_output_316_0 , ( temp_output_316_0 * ( _Global_Admech_View + _Global_Necron_View ) ) , _onlyinNoosphere);
				float lerpResult430 = lerp( 1.0 , ( step( _Activeforfaction , ( _Global_Faction + 0.1 ) ) * ( 1.0 - step( _Activeforfaction , ( _Global_Faction - 0.1 ) ) ) ) , _AppearsonlyforspecificFaction);
				

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				surfaceDescription.Alpha = ( lerpResult423 * lerpResult430 ).r;
				surfaceDescription.AlphaClipThreshold =  _AlphaCutoff;

				#ifdef ASE_DEPTH_WRITE_ON
				posInput.deviceDepth = input.positionSS.z;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#if defined(_DEPTHOFFSET_ON) || defined(ASE_DEPTH_WRITE_ON)
				outputDepth = posInput.deviceDepth;
				#endif

				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthForwardOnly"
			Tags { "LightMode"="DepthForwardOnly" }

			Cull [_CullMode]
			ZWrite On
			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
			}


			ColorMask 0 0

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define HAVE_MESH_MODIFICATION 1
			#define ASE_VERSION 19904
			#define ASE_SRP_VERSION 170200


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile _ WRITE_MSAA_DEPTH

			#pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
            #define SUPPORT_GLOBAL_MIP_BIAS 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			CBUFFER_START( UnityPerMaterial )
			float4 _Color;
			float4 _Tilingandoffset;
			float4 _TilingandoffsetDistortion;
			float2 _ScrollingSpeedDistortion;
			float2 _RadialGradienttiling;
			float2 _ScrollingSpeed;
			float2 _PolarUVCenter;
			float _LinearGradients;
			float _LinearGradientpower;
			float _GradientnegatifV;
			float _Vertexoffsetsize;
			float _GradientnegatifU;
			float _GradientpositifU;
			float _RadialGradient;
			float _RedialGradientinvertedPower;
			float _GradientpositifV;
			float _AlphaErosionPower;
			float _DepthFade;
			float _DepthDistance;
			float _InverseDepthfadeintensity;
			float _InverseDepthfade;
			float _ColorGradientadjust;
			float _UseGradientascolor;
			float _Intensity;
			float _Alpha;
			float _Trail;
			float _onlyinNoosphere;
			float _AlphaErosion;
			float _RedialGradientPower;
			float _Channelusedasalpha;
			float _CompensateFadingExposure;
			float _VertexoffsetinWorldSpace;
			float _VertexOffsetintensity;
			float _VertexoffsetfromAlpha;
			float _Vertexoffsetgradient;
			float _WorldpositionDistortionUVscale;
			float _WorldpositionDistortion;
			float _DistortionIntensity;
			float _DistortionAlphapower;
			float _Distortioninfluencedbyalpha;
			float _Twistcenter;
			float _TwistEdges;
			float _PolarpowerV;
			float _PolartilingU;
			float _PolartilingV;
			float _PolarUV;
			float _WorldpositionUVscale;
			float _WorldpositionMainTexture;
			float _Chromaticabberation;
			float _Activeforfaction;
			float _RadialGradientingammaspace;
			float _AppearsonlyforspecificFaction;
			float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _EnableBlendModePreserveSpecularLighting;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _VertexoffsetTexture;
			sampler2D _MainTex;
			sampler2D _DistortionTexture;
			float _Global_Admech_View;
			float _Global_Necron_View;
			float _Global_Faction;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_SCREEN_POSITION_NORMALIZED


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				#ifdef WRITE_NORMAL_BUFFER
				surfaceData.normalWS = fragInputs.tangentToWorld[2];
				#endif
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif

				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#if _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);
				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity =  surfaceDescription.Alpha;

				#if defined(DEBUG_DISPLAY)
					builtinData.renderingLayers = GetMeshRenderingLayerMask();
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif

                ApplyDebugToBuiltinData(builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction( AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS o;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float2 texCoord360 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float3 ase_positionWS = GetAbsolutePositionWS( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float2 appendResult363 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult361 = lerp( texCoord360 , ( appendResult363 / _Vertexoffsetsize ) , _VertexoffsetinWorldSpace);
				float lerpResult286 = lerp( 0.0 , inputMesh.ase_color.a , _VertexoffsetfromAlpha);
				float2 texCoord276 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult368 = lerp( 1.0 , ( texCoord276.x * ( 1.0 - texCoord276.x ) * 4.0 ) , _Vertexoffsetgradient);
				
				o.ase_texcoord1.xy = inputMesh.ase_texcoord.xy;
				o.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  ( ( tex2Dlod( _VertexoffsetTexture, float4( lerpResult361, 0, 0.0) ) + -0.5 ) * _VertexOffsetintensity * ( 1.0 - lerpResult286 ) * lerpResult368 ).rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);
				o.positionRWS = positionRWS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#ifdef WRITE_MSAA_DEPTH
						, out float4 depthColor : SV_Target0
							#ifdef WRITE_NORMAL_BUFFER
							, out float4 outNormalBuffer : SV_Target1
							#endif
						#else
							#ifdef WRITE_NORMAL_BUFFER
							, out float4 outNormalBuffer : SV_Target0
							#endif
						#endif
						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
					
					)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 PositionRWS = packedInput.positionRWS;
				float3 V = GetWorldSpaceNormalizeViewDir( packedInput.positionRWS );
				float4 ScreenPosNorm = float4( posInput.positionNDC, packedInput.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, packedInput.positionCS.z ) * packedInput.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos, _ProjectionParams.x );

				float2 appendResult209 = (float2(_Tilingandoffset.x , _Tilingandoffset.y));
				float2 appendResult210 = (float2(_Tilingandoffset.z , _Tilingandoffset.w));
				float2 texCoord88 = packedInput.ase_texcoord1.xy * appendResult209 + appendResult210;
				float2 appendResult219 = (float2(_TilingandoffsetDistortion.x , _TilingandoffsetDistortion.y));
				float2 appendResult220 = (float2(_TilingandoffsetDistortion.z , _TilingandoffsetDistortion.w));
				float2 texCoord217 = packedInput.ase_texcoord1.xy * appendResult219 + appendResult220;
				float2 panner212 = ( 1.0 * _Time.y * _ScrollingSpeedDistortion + texCoord217);
				float3 ase_positionWS = GetAbsolutePositionWS( PositionRWS );
				float2 appendResult388 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult392 = lerp( panner212 , ( appendResult388 / _WorldpositionDistortionUVscale ) , _WorldpositionDistortion);
				float2 appendResult222 = (float2(1.0 , 1.0));
				float clampResult416 = clamp( ( 1.0 - packedInput.ase_color.a ) , 0.0001 , 1.0 );
				float lerpResult290 = lerp( 1.0 , pow( clampResult416 , _DistortionAlphapower ) , _Distortioninfluencedbyalpha);
				float2 temp_output_223_0 = ( ( tex2D( _DistortionTexture, lerpResult392 ).r - 0.5 ) * appendResult222 * _DistortionIntensity * saturate( lerpResult290 ) );
				float2 texCoord230 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break4_g96 = ( ( texCoord230 - _PolarUVCenter ) * float2( 2,2 ) );
				float temp_output_29_0_g95 = sqrt( ( ( break4_g96.x * break4_g96.x ) + ( break4_g96.y * break4_g96.y ) ) );
				float lerpResult9_g95 = lerp( _Twistcenter , _TwistEdges , temp_output_29_0_g95);
				float2 appendResult10_g95 = (float2(( ( ( atan2( break4_g96.y , break4_g96.x ) / TWO_PI ) + 0.5 ) + lerpResult9_g95 ) , pow( temp_output_29_0_g95 , _PolarpowerV )));
				float2 break17_g95 = appendResult10_g95;
				float2 appendResult22_g95 = (float2(( break17_g95.x * floor( _PolartilingU ) ) , ( _PolartilingV * break17_g95.y )));
				float2 lerpResult125 = lerp( ( texCoord88 + temp_output_223_0 ) , ( ( appendResult22_g95 + temp_output_223_0 ) * appendResult209 ) , _PolarUV);
				float2 panner97 = ( 1.0 * _Time.y * _ScrollingSpeed + lerpResult125);
				float2 appendResult382 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult380 = lerp( panner97 , ( appendResult382 / _WorldpositionUVscale ) , _WorldpositionMainTexture);
				float4 tex2DNode13 = tex2D( _MainTex, ( lerpResult380 + ( float2( -1,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) );
				float4 appendResult408 = (float4(tex2DNode13.r , tex2D( _MainTex, ( lerpResult380 + ( float2( 0,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) ).g , tex2D( _MainTex, ( lerpResult380 + ( float2( 1,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) ).b , tex2DNode13.a));
				float4 temp_output_13_0_g92 = appendResult408;
				float4 break15_g92 = temp_output_13_0_g92;
				float temp_output_17_0_g92 = _Channelusedasalpha;
				float lerpResult4_g92 = lerp( break15_g92.r , break15_g92.g , temp_output_17_0_g92);
				float lerpResult5_g92 = lerp( lerpResult4_g92 , break15_g92.b , saturate( ( temp_output_17_0_g92 + -1.0 ) ));
				float lerpResult7_g92 = lerp( lerpResult5_g92 , break15_g92.a , saturate( ( temp_output_17_0_g92 + -2.0 ) ));
				float4 temp_cast_1 = (lerpResult7_g92).xxxx;
				float4 lerpResult8_g92 = lerp( temp_cast_1 , temp_output_13_0_g92 , saturate( ( temp_output_17_0_g92 + -3.0 ) ));
				float4 temp_output_411_0 = lerpResult8_g92;
				float2 texCoord2_g85 = packedInput.ase_texcoord1.xy * _RadialGradienttiling + float2( 0,0 );
				float temp_output_4_0_g85 = length(  (float2( -1,-1 ) + ( fmod( texCoord2_g85 , float2( 1,1 ) ) - float2( 0,0 ) ) * ( float2( 1,1 ) - float2( -1,-1 ) ) / ( float2( 1,1 ) - float2( 0,0 ) ) ) );
				float clampResult6_g85 = clamp( temp_output_4_0_g85 , 0.0 , 1.0 );
				float3 temp_cast_2 = (temp_output_4_0_g85).xxx;
				float3 temp_cast_3 = (temp_output_4_0_g85).xxx;
				float3 linearToGamma12_g85 = FastLinearToSRGB( temp_cast_3 );
				float lerpResult373 = lerp( clampResult6_g85 , linearToGamma12_g85.x , _RadialGradientingammaspace);
				float lerpResult86 = lerp( 1.0 , pow( saturate( ( 1.0 - pow( lerpResult373 , _RedialGradientPower ) ) ) , _RedialGradientinvertedPower ) , _RadialGradient);
				float temp_output_239_0 = saturate( lerpResult86 );
				float2 texCoord325 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult357 = lerp( 1.0 , pow( ( saturate( ( texCoord325.x / _GradientpositifU ) ) * saturate( ( ( 1.0 - texCoord325.x ) / _GradientnegatifU ) ) * saturate( ( texCoord325.y / _GradientpositifV ) ) * saturate( ( ( 1.0 - texCoord325.y ) / _GradientnegatifV ) ) ) , _LinearGradientpower ) , _LinearGradients);
				float temp_output_16_0_g86 = ( 1.0 - saturate( ( ( 1.0 - pow( ( 1.0 - packedInput.ase_color.a ) , _AlphaErosionPower ) ) * temp_output_239_0 * lerpResult357 ) ) );
				float temp_output_3_0_g86 = ( saturate( temp_output_411_0.r ) - temp_output_16_0_g86 );
				float4 temp_cast_5 = (saturate( temp_output_3_0_g86 )).xxxx;
				float4 lerpResult76 = lerp( ( temp_output_411_0 * ( pow( packedInput.ase_color.a , _CompensateFadingExposure ) * temp_output_239_0 * lerpResult357 ) ) , temp_cast_5 , _AlphaErosion);
				float screenDepth40 = LinearEyeDepth(SampleCameraDepth( ScreenPosNorm.xy ),_ZBufferParams);
				float distanceDepth40 = abs( ( screenDepth40 - LinearEyeDepth( ScreenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float lerpResult89 = lerp( 1.0 , pow( saturate( distanceDepth40 ) , 3.0 ) , _DepthFade);
				float temp_output_317_0 = saturate( lerpResult89 );
				float lerpResult266 = lerp( temp_output_317_0 , ( ( 1.0 - temp_output_317_0 ) * _InverseDepthfadeintensity ) , _InverseDepthfade);
				float4 temp_output_84_0 = ( lerpResult76 * lerpResult266 );
				float2 texCoord297 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_302_0 = ( texCoord297.x + ( ( packedInput.ase_color.a * 2.0 ) + -1.0 ) );
				float lerpResult306 = lerp( 1.0 , saturate( ( ( 1.0 - temp_output_302_0 ) * temp_output_302_0 * 4.0 ) ) , _Trail);
				float4 temp_output_316_0 = saturate( ( ( temp_output_84_0 * _Alpha ) * lerpResult306 ) );
				float4 lerpResult423 = lerp( temp_output_316_0 , ( temp_output_316_0 * ( _Global_Admech_View + _Global_Necron_View ) ) , _onlyinNoosphere);
				float lerpResult430 = lerp( 1.0 , ( step( _Activeforfaction , ( _Global_Faction + 0.1 ) ) * ( 1.0 - step( _Activeforfaction , ( _Global_Faction - 0.1 ) ) ) ) , _AppearsonlyforspecificFaction);
				

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				surfaceDescription.Alpha = ( lerpResult423 * lerpResult430 ).r;
				surfaceDescription.AlphaClipThreshold =  _AlphaCutoff;

				#ifdef ASE_DEPTH_WRITE_ON
				posInput.deviceDepth = input.positionSS.z;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#if defined(_DEPTHOFFSET_ON) || defined(ASE_DEPTH_WRITE_ON)
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.positionCS.z;
					#ifdef _ALPHATOMASK_ON
					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
					#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif
			}

			ENDHLSL
		}

		
        Pass
		{
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }

            Cull [_CullMode]

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define HAVE_MESH_MODIFICATION 1
			#define ASE_VERSION 19904
			#define ASE_SRP_VERSION 170200


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT

			#pragma editor_sync_compilation

			#pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

			#if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENEPICKINGPASS 1
            #define SUPPORT_GLOBAL_MIP_BIAS 1

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_TANGENT_TO_WORLD

			#define SHADER_UNLIT

			float4 _SelectionID;

            CBUFFER_START( UnityPerMaterial )
			float4 _Color;
			float4 _Tilingandoffset;
			float4 _TilingandoffsetDistortion;
			float2 _ScrollingSpeedDistortion;
			float2 _RadialGradienttiling;
			float2 _ScrollingSpeed;
			float2 _PolarUVCenter;
			float _LinearGradients;
			float _LinearGradientpower;
			float _GradientnegatifV;
			float _Vertexoffsetsize;
			float _GradientnegatifU;
			float _GradientpositifU;
			float _RadialGradient;
			float _RedialGradientinvertedPower;
			float _GradientpositifV;
			float _AlphaErosionPower;
			float _DepthFade;
			float _DepthDistance;
			float _InverseDepthfadeintensity;
			float _InverseDepthfade;
			float _ColorGradientadjust;
			float _UseGradientascolor;
			float _Intensity;
			float _Alpha;
			float _Trail;
			float _onlyinNoosphere;
			float _AlphaErosion;
			float _RedialGradientPower;
			float _Channelusedasalpha;
			float _CompensateFadingExposure;
			float _VertexoffsetinWorldSpace;
			float _VertexOffsetintensity;
			float _VertexoffsetfromAlpha;
			float _Vertexoffsetgradient;
			float _WorldpositionDistortionUVscale;
			float _WorldpositionDistortion;
			float _DistortionIntensity;
			float _DistortionAlphapower;
			float _Distortioninfluencedbyalpha;
			float _Twistcenter;
			float _TwistEdges;
			float _PolarpowerV;
			float _PolartilingU;
			float _PolartilingV;
			float _PolarUV;
			float _WorldpositionUVscale;
			float _WorldpositionMainTexture;
			float _Chromaticabberation;
			float _Activeforfaction;
			float _RadialGradientingammaspace;
			float _AppearsonlyforspecificFaction;
			float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _EnableBlendModePreserveSpecularLighting;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _VertexoffsetTexture;
			sampler2D _MainTex;
			sampler2D _DistortionTexture;
			float _Global_Admech_View;
			float _Global_Necron_View;
			float _Global_Faction;


            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_COLOR


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 tangentWS : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			
            struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};


            void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                #ifdef LOD_FADE_CROSSFADE
			        LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif

                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif

                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif


				ZERO_INITIALIZE(SurfaceData, surfaceData);

				ZERO_BUILTIN_INITIALIZE(builtinData);
				builtinData.opacity = surfaceDescription.Alpha;

				#if defined(DEBUG_DISPLAY)
					builtinData.renderingLayers = GetMeshRenderingLayerMask();
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif

                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif


                ApplyDebugToBuiltinData(builtinData);

            }


			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh  )
			{

				PackedVaryingsMeshToPS o;
				ZERO_INITIALIZE(PackedVaryingsMeshToPS, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o );

				float2 texCoord360 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float3 ase_positionWS = GetAbsolutePositionWS( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float2 appendResult363 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult361 = lerp( texCoord360 , ( appendResult363 / _Vertexoffsetsize ) , _VertexoffsetinWorldSpace);
				float lerpResult286 = lerp( 0.0 , inputMesh.ase_color.a , _VertexoffsetfromAlpha);
				float2 texCoord276 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult368 = lerp( 1.0 , ( texCoord276.x * ( 1.0 - texCoord276.x ) * 4.0 ) , _Vertexoffsetgradient);
				
				o.ase_texcoord3.xyz = ase_positionWS;
				float4 ase_positionCS = TransformWorldToHClip( TransformObjectToWorld( ( inputMesh.positionOS ).xyz ) );
				float4 screenPos = ComputeScreenPos( ase_positionCS, _ProjectionParams.x );
				o.ase_texcoord4 = screenPos;
				
				o.ase_texcoord2.xy = inputMesh.ase_texcoord.xy;
				o.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  ( ( tex2Dlod( _VertexoffsetTexture, float4( lerpResult361, 0, 0.0) ) + -0.5 ) * _VertexOffsetintensity * ( 1.0 - lerpResult286 ) * lerpResult368 ).rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				o.positionCS = TransformWorldToHClip(positionRWS);
				o.normalWS.xyz =  normalWS;
				o.tangentWS.xyzw =  tangentWS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag(	PackedVaryingsMeshToPS packedInput
						, out float4 outColor : SV_Target0
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS.xyzw, packedInput.normalWS.xyz);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = float3(1.0, 1.0, 1.0);

				float2 appendResult209 = (float2(_Tilingandoffset.x , _Tilingandoffset.y));
				float2 appendResult210 = (float2(_Tilingandoffset.z , _Tilingandoffset.w));
				float2 texCoord88 = packedInput.ase_texcoord2.xy * appendResult209 + appendResult210;
				float2 appendResult219 = (float2(_TilingandoffsetDistortion.x , _TilingandoffsetDistortion.y));
				float2 appendResult220 = (float2(_TilingandoffsetDistortion.z , _TilingandoffsetDistortion.w));
				float2 texCoord217 = packedInput.ase_texcoord2.xy * appendResult219 + appendResult220;
				float2 panner212 = ( 1.0 * _Time.y * _ScrollingSpeedDistortion + texCoord217);
				float3 ase_positionWS = packedInput.ase_texcoord3.xyz;
				float2 appendResult388 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult392 = lerp( panner212 , ( appendResult388 / _WorldpositionDistortionUVscale ) , _WorldpositionDistortion);
				float2 appendResult222 = (float2(1.0 , 1.0));
				float clampResult416 = clamp( ( 1.0 - packedInput.ase_color.a ) , 0.0001 , 1.0 );
				float lerpResult290 = lerp( 1.0 , pow( clampResult416 , _DistortionAlphapower ) , _Distortioninfluencedbyalpha);
				float2 temp_output_223_0 = ( ( tex2D( _DistortionTexture, lerpResult392 ).r - 0.5 ) * appendResult222 * _DistortionIntensity * saturate( lerpResult290 ) );
				float2 texCoord230 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break4_g96 = ( ( texCoord230 - _PolarUVCenter ) * float2( 2,2 ) );
				float temp_output_29_0_g95 = sqrt( ( ( break4_g96.x * break4_g96.x ) + ( break4_g96.y * break4_g96.y ) ) );
				float lerpResult9_g95 = lerp( _Twistcenter , _TwistEdges , temp_output_29_0_g95);
				float2 appendResult10_g95 = (float2(( ( ( atan2( break4_g96.y , break4_g96.x ) / TWO_PI ) + 0.5 ) + lerpResult9_g95 ) , pow( temp_output_29_0_g95 , _PolarpowerV )));
				float2 break17_g95 = appendResult10_g95;
				float2 appendResult22_g95 = (float2(( break17_g95.x * floor( _PolartilingU ) ) , ( _PolartilingV * break17_g95.y )));
				float2 lerpResult125 = lerp( ( texCoord88 + temp_output_223_0 ) , ( ( appendResult22_g95 + temp_output_223_0 ) * appendResult209 ) , _PolarUV);
				float2 panner97 = ( 1.0 * _Time.y * _ScrollingSpeed + lerpResult125);
				float2 appendResult382 = (float2(ase_positionWS.x , ase_positionWS.z));
				float2 lerpResult380 = lerp( panner97 , ( appendResult382 / _WorldpositionUVscale ) , _WorldpositionMainTexture);
				float4 tex2DNode13 = tex2D( _MainTex, ( lerpResult380 + ( float2( -1,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) );
				float4 appendResult408 = (float4(tex2DNode13.r , tex2D( _MainTex, ( lerpResult380 + ( float2( 0,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) ).g , tex2D( _MainTex, ( lerpResult380 + ( float2( 1,1 ) * _Chromaticabberation ) ), float2( 0,0 ), float2( 0,0 ) ).b , tex2DNode13.a));
				float4 temp_output_13_0_g92 = appendResult408;
				float4 break15_g92 = temp_output_13_0_g92;
				float temp_output_17_0_g92 = _Channelusedasalpha;
				float lerpResult4_g92 = lerp( break15_g92.r , break15_g92.g , temp_output_17_0_g92);
				float lerpResult5_g92 = lerp( lerpResult4_g92 , break15_g92.b , saturate( ( temp_output_17_0_g92 + -1.0 ) ));
				float lerpResult7_g92 = lerp( lerpResult5_g92 , break15_g92.a , saturate( ( temp_output_17_0_g92 + -2.0 ) ));
				float4 temp_cast_1 = (lerpResult7_g92).xxxx;
				float4 lerpResult8_g92 = lerp( temp_cast_1 , temp_output_13_0_g92 , saturate( ( temp_output_17_0_g92 + -3.0 ) ));
				float4 temp_output_411_0 = lerpResult8_g92;
				float2 texCoord2_g85 = packedInput.ase_texcoord2.xy * _RadialGradienttiling + float2( 0,0 );
				float temp_output_4_0_g85 = length(  (float2( -1,-1 ) + ( fmod( texCoord2_g85 , float2( 1,1 ) ) - float2( 0,0 ) ) * ( float2( 1,1 ) - float2( -1,-1 ) ) / ( float2( 1,1 ) - float2( 0,0 ) ) ) );
				float clampResult6_g85 = clamp( temp_output_4_0_g85 , 0.0 , 1.0 );
				float3 temp_cast_2 = (temp_output_4_0_g85).xxx;
				float3 temp_cast_3 = (temp_output_4_0_g85).xxx;
				float3 linearToGamma12_g85 = FastLinearToSRGB( temp_cast_3 );
				float lerpResult373 = lerp( clampResult6_g85 , linearToGamma12_g85.x , _RadialGradientingammaspace);
				float lerpResult86 = lerp( 1.0 , pow( saturate( ( 1.0 - pow( lerpResult373 , _RedialGradientPower ) ) ) , _RedialGradientinvertedPower ) , _RadialGradient);
				float temp_output_239_0 = saturate( lerpResult86 );
				float2 texCoord325 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult357 = lerp( 1.0 , pow( ( saturate( ( texCoord325.x / _GradientpositifU ) ) * saturate( ( ( 1.0 - texCoord325.x ) / _GradientnegatifU ) ) * saturate( ( texCoord325.y / _GradientpositifV ) ) * saturate( ( ( 1.0 - texCoord325.y ) / _GradientnegatifV ) ) ) , _LinearGradientpower ) , _LinearGradients);
				float temp_output_16_0_g86 = ( 1.0 - saturate( ( ( 1.0 - pow( ( 1.0 - packedInput.ase_color.a ) , _AlphaErosionPower ) ) * temp_output_239_0 * lerpResult357 ) ) );
				float temp_output_3_0_g86 = ( saturate( temp_output_411_0.r ) - temp_output_16_0_g86 );
				float4 temp_cast_5 = (saturate( temp_output_3_0_g86 )).xxxx;
				float4 lerpResult76 = lerp( ( temp_output_411_0 * ( pow( packedInput.ase_color.a , _CompensateFadingExposure ) * temp_output_239_0 * lerpResult357 ) ) , temp_cast_5 , _AlphaErosion);
				float4 screenPos = packedInput.ase_texcoord4;
				float4 ase_positionSSNorm = screenPos / screenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float screenDepth40 = LinearEyeDepth(SampleCameraDepth( ase_positionSSNorm.xy ),_ZBufferParams);
				float distanceDepth40 = abs( ( screenDepth40 - LinearEyeDepth( ase_positionSSNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float lerpResult89 = lerp( 1.0 , pow( saturate( distanceDepth40 ) , 3.0 ) , _DepthFade);
				float temp_output_317_0 = saturate( lerpResult89 );
				float lerpResult266 = lerp( temp_output_317_0 , ( ( 1.0 - temp_output_317_0 ) * _InverseDepthfadeintensity ) , _InverseDepthfade);
				float4 temp_output_84_0 = ( lerpResult76 * lerpResult266 );
				float2 texCoord297 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_302_0 = ( texCoord297.x + ( ( packedInput.ase_color.a * 2.0 ) + -1.0 ) );
				float lerpResult306 = lerp( 1.0 , saturate( ( ( 1.0 - temp_output_302_0 ) * temp_output_302_0 * 4.0 ) ) , _Trail);
				float4 temp_output_316_0 = saturate( ( ( temp_output_84_0 * _Alpha ) * lerpResult306 ) );
				float4 lerpResult423 = lerp( temp_output_316_0 , ( temp_output_316_0 * ( _Global_Admech_View + _Global_Necron_View ) ) , _onlyinNoosphere);
				float lerpResult430 = lerp( 1.0 , ( step( _Activeforfaction , ( _Global_Faction + 0.1 ) ) * ( 1.0 - step( _Activeforfaction , ( _Global_Faction - 0.1 ) ) ) ) , _AppearsonlyforspecificFaction);
				

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				surfaceDescription.Alpha = ( lerpResult423 * lerpResult430 ).r;
				surfaceDescription.AlphaClipThreshold =  _AlphaCutoff;

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);
				outColor = unity_SelectionID;
			}

            ENDHLSL
        }

		Pass
		{
			Name "FullScreenDebug"
			Tags
			{
				"LightMode" = "FullScreenDebug"
			}

			Cull [_CullMode]
			ZTest LEqual
			ZWrite Off

			HLSLPROGRAM

			/*ase_pragma_before*/

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_FULL_SCREEN_DEBUG
            #define SUPPORT_GLOBAL_MIP_BIAS 1

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : INSTANCEID_SEMANTIC;
				#endif
			};

			struct VaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

			VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
			{
				VaryingsMeshToPS output;
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

			PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
			{
				PackedVaryingsMeshToPS output;
				ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

			FragInputs BuildFragInputs(VaryingsMeshToPS input)
			{
				FragInputs output;
				ZERO_INITIALIZE(FragInputs, output);

				output.tangentToWorld = k_identity3x3;
				output.positionSS = input.positionCS;

				return output;
			}

			FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
			{
				UNITY_SETUP_INSTANCE_ID(input);
				VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
				return BuildFragInputs(unpacked);
			}

			#define DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/FullScreenDebug.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/VertMesh.hlsl"

			PackedVaryingsType Vert(AttributesMesh inputMesh)
			{
				VaryingsType varyingsType;
				varyingsType.vmesh = VertMesh(inputMesh);
				return PackVaryingsType(varyingsType);
			}

			#if !defined(_DEPTHOFFSET_ON)
			[earlydepthstencil] // quad overshading debug mode writes to UAV
			#endif
			void Frag(PackedVaryingsToPS packedInput)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				FragInputs input = UnpackVaryingsToFragInputs(packedInput);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz);

			#ifdef PLATFORM_SUPPORTS_PRIMITIVE_ID_IN_PIXEL_SHADER
				if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_QUAD_OVERDRAW)
				{
					IncrementQuadOverdrawCounter(posInput.positionSS.xy, input.primitiveID);
				}
			#endif
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "Rendering.HighDefinition.HDUnlitGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=19904
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;289;-4668.833,-1142.916;Inherit;False;1579.512;451.4149;Comment;13;211;212;217;218;220;219;226;223;224;222;294;392;415;Distortion;1,1,1,1;0;0
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;218;-4879.833,-1093.36;Inherit;False;Property;_TilingandoffsetDistortion;Tiling and offset Distortion;55;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,0.5,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;220;-4639.833,-1016.36;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;219;-4642.833,-1104.359;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldPosInputsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;387;-4436.228,-1525.854;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.VertexColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;291;-4653.45,-772.7603;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;217;-4513.833,-1076.36;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;226;-4497.721,-903.9827;Inherit;False;Property;_ScrollingSpeedDistortion;Scrolling Speed Distortion;54;0;Create;True;0;0;0;False;0;False;0,0;0.1,-0.1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;388;-4236.711,-1470.088;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;390;-4275.054,-1352.361;Inherit;False;Property;_WorldpositionDistortionUVscale;World position Distortion UV scale;57;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;292;-4446.338,-689.9603;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;296;-4507.016,-583.5027;Inherit;False;Property;_DistortionAlphapower;Distortion Alpha power;51;0;Create;True;0;0;0;False;0;False;1;2;0.001;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;212;-4249.834,-1090.36;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0,-0.1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;389;-3988.865,-1504.787;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;391;-4209.448,-1700.586;Inherit;False;Property;_WorldpositionDistortion;World position Distortion;56;1;[Toggle];Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;416;-4283.23,-702.4459;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.0001;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;123;-4203.528,-434.1273;Inherit;False;774;463;Comment;7;88;125;126;221;227;229;230;POLAR UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;293;-4211.017,-538.5027;Inherit;False;Property;_Distortioninfluencedbyalpha;Distortion influenced by alpha;50;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;392;-3909.115,-1078.43;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PowerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;295;-4129.13,-679.588;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;290;-3955.017,-758.5027;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;211;-3677.199,-1092.917;Inherit;True;Property;_DistortionTexture;Distortion Texture;52;0;Create;True;0;0;0;False;0;False;-1;None;841ad33c2bd5af8448cf499ac7c0c073;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;230;-4197.85,-322.7;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;208;-4720.133,-200.6091;Inherit;False;Property;_Tilingandoffset;Tiling and offset;31;0;Create;True;0;0;0;False;0;False;1,1,0,0;2,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;52;-2678.72,520.7518;Inherit;False;1381.128;298.6866;Comment;7;372;37;151;86;373;375;376;Radial Gradient;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;222;-3440.406,-902.9593;Inherit;False;FLOAT2;4;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;294;-3342.017,-1010.503;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;322;-2889.4,612.3445;Inherit;False;Property;_RadialGradienttiling;Radial Gradient tiling;17;0;Create;True;0;0;0;False;0;False;1,1;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;210;-4379.66,-91.36298;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;209;-4379.66,-197.9632;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;414;-3977.701,-318.6877;Inherit;False;Polar UV;34;;95;c4233c329a4c24140b2a5ebfd47bf4ca;0;2;30;FLOAT;0;False;12;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;224;-3751.445,-835.2164;Inherit;False;Property;_DistortionIntensity;Distortion Intensity;49;1;[Header];Create;True;1;DISTORTION;0;0;False;0;False;0;0.19;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;412;-3742.369,-733.934;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;372;-2676.02,602.1255;Inherit;True;RadialGradient;-1;;85;17b34db2de617c24f858e8c0e78a02c5;0;1;7;FLOAT2;0,0;False;3;FLOAT;0;FLOAT;13;FLOAT;11
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;374;-2622.652,908.0136;Inherit;False;Property;_RadialGradientingammaspace;Radial Gradient in gamma space;14;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;88;-4177.36,-142.806;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;221;-3723.625,-356.4346;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;223;-3251.323,-871.1828;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;373;-2270.652,608.0136;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;152;-2308.153,898.6577;Inherit;False;Property;_RedialGradientPower;Redial Gradient Power;15;0;Create;True;0;0;0;False;0;False;1;1;0.01;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;325;-1575.05,1162.512;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;227;-3699.321,-209.2711;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;229;-3581.746,-328.6241;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;126;-3909.529,-78.12718;Inherit;False;Property;_PolarUV;Polar UV;33;2;[Header];[Toggle];Create;True;1;POLAR UVs;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;381;-3593.309,237.2999;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;410;-2904.219,-513.3243;Inherit;False;596.488;870.8912;Comment;11;380;403;402;399;398;401;406;397;405;404;407;Chromatic Abberation;1,1,1,1;0;0
Node;AmplifyShaderEditor.PowerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;151;-2120.123,612.0261;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;331;-1292.859,1246.568;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;335;-1289.257,1468.718;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;340;-1421.345,1083.258;Inherit;False;Property;_GradientnegatifU;Gradient negatif U;21;0;Create;True;0;0;0;False;0;False;1E-05;1E-05;1E-05;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;341;-1566.043,1559.979;Inherit;False;Property;_GradientpositifV;Gradient positif V;22;0;Create;True;0;0;0;False;0;False;1E-05;1E-05;1E-05;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;342;-1544.428,1641.635;Inherit;False;Property;_GradientnegatifV;Gradient negatif V;23;0;Create;True;0;0;0;False;0;False;1E-05;1E-05;1E-05;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;338;-1424.948,906.74;Inherit;False;Property;_GradientpositifU;Gradient positif U;20;0;Create;True;0;0;0;False;0;False;1E-05;1E-05;1E-05;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;125;-3541.228,-233.3273;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;225;-3566.719,1.328922;Inherit;False;Property;_ScrollingSpeed;Scrolling Speed;32;0;Create;True;0;0;0;False;0;False;0,0;0,-1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;382;-3393.792,293.0654;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;385;-3430.969,410.7927;Inherit;False;Property;_WorldpositionUVscale;World position UV scale;26;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;70;-84.22857,968.6841;Inherit;False;942.7454;274.3241;Comment;6;90;172;89;42;91;40;Depth Fade;1,1,1,1;0;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;37;-1968.718,613.2415;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;329;-1076.714,1109.676;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;332;-1073.111,1239.364;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;333;-1081.517,1343.834;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;334;-1083.918,1472.321;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;97;-3327.693,-287.2843;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0,-0.1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;384;-3145.946,258.3669;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;386;-3366.529,62.56799;Inherit;False;Property;_WorldpositionMainTexture;World position Main Texture;25;1;[Toggle];Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;403;-2751.237,-104.0295;Inherit;False;Constant;_Vector3;Vector 1;54;0;Create;True;0;0;0;False;0;False;0,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;402;-2760.391,66.46372;Inherit;False;Constant;_Vector2;Vector 1;54;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;401;-2854.219,-463.3243;Inherit;False;Constant;_Vector1;Vector 1;54;0;Create;True;0;0;0;False;0;False;-1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;407;-2741.778,244.567;Inherit;False;Property;_Chromaticabberation;Chromatic abberation;30;0;Create;True;0;0;0;False;0;False;0;0.03119154;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;42;-62.55296,1056.514;Float;False;Property;_DepthDistance;Depth Distance;48;0;Create;True;0;0;0;False;0;False;1;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;375;-1807.652,614.0136;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;377;-1940.652,864.0136;Inherit;False;Property;_RedialGradientinvertedPower;Redial Gradient inverted Power;16;0;Create;True;0;0;0;False;0;False;1;1;0.01;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;343;-942.2219,1187.729;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;344;-949.4265,1258.577;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;345;-932.6152,1330.625;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;346;-933.8161,1409.879;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;380;-2835.564,-268.8524;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;406;-2704.321,-447.3048;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;405;-2603.73,-111.7408;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;404;-2597.11,29.84779;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;243;-1751.365,374.4022;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;308;1833.132,719.5118;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DepthFade, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;40;129.4464,1040.515;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;249;-1864.689,473.0882;Inherit;False;Property;_AlphaErosionPower;Alpha Erosion Power;12;0;Create;True;0;0;0;False;0;False;2;2;1;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;87;-1833.532,994.6887;Inherit;False;Property;_RadialGradient;Radial Gradient;13;2;[Header];[Toggle];Create;True;1;RADIAL GRADIENT;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;376;-1670.652,592.0136;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;336;-759.6107,1211.568;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;394;-831.3947,1543.687;Inherit;False;Property;_LinearGradientpower;Linear Gradient power;19;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;27;-2431.727,-1000.065;Float;True;Property;_MainTex;MainTex;24;1;[Header];Create;True;1;MAIN TEXTURE;0;0;False;0;False;e0291fc1155c8bd4f86ceb1f737dc411;e298f18315fb4b94cae2a325727c534c;False;white;Auto;Texture2D;False;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;399;-2453.731,-117.7605;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;398;-2486.914,-275.6672;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;397;-2553.279,-435.8623;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;246;-1470.064,93.50232;Inherit;False;Property;_CompensateFadingExposure;Compensate Fading Exposure ;9;1;[Enum];Create;True;0;3;Strong;4;Light;2;Off;1;0;False;0;False;4;4;1;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;170;-1589.684,379.8036;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;309;2047.632,796.2118;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;91;386.4476,1047.514;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3;-1937.872,-5.810955;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;86;-1461.403,600.1555;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;358;-695.2243,1059.838;Inherit;False;Constant;_Float7;Float 7;42;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;359;-593.9703,1407.566;Inherit;False;Property;_LinearGradients;Linear Gradients;18;1;[Toggle];Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;393;-623.3947,1212.188;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;13;-2181.201,-758.2861;Inherit;True;Property;_Test;Test;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Derivative;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;395;-2178.28,-518.482;Inherit;True;Property;_Test1;Test;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Derivative;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;396;-2185.543,-257.0288;Inherit;True;Property;_Test2;Test;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Derivative;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;244;-1438.065,378.3022;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;245;-1206.664,16.90236;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;297;1632.123,313.4415;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;311;2199.732,804.0119;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;172;527.4207,1037.936;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;90;271.9885,1136.759;Inherit;False;Property;_DepthFade;Depth Fade;45;2;[Header];[Toggle];Create;True;1;DEPTH FADE;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;239;-1265.523,663.5483;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;357;-482.0581,1150.434;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;408;-1849.127,-561.3882;Inherit;True;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;83;-771.4795,-301.4422;Inherit;False;259.7562;272.085;Comment;1;36;No Alpha Erosion;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;104;-1007.494,32.99885;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;302;1897.123,337.4415;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;89;699.9886,1024.759;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;269;795.554,1219.914;Inherit;False;Property;_InverseDepthfadeintensity;Inverse Depth fade intensity;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;248;-1040.107,261.6008;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;267;1001.598,1087.085;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;411;-1364.161,-385.6829;Inherit;True;Channel Choice;27;;92;d2a350ea424b40e4b87aa87ee0900647;0;2;17;FLOAT;0;False;13;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT;19
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;299;2039.123,297.4415;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;301;2080.823,557.5413;Inherit;False;Constant;_Float3;Float 3;34;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;77;30.21767,245.2491;Inherit;False;Property;_AlphaErosion;Alpha Erosion;11;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;270;953.919,1353.216;Inherit;False;Property;_InverseDepthfade;Inverse Depth fade;47;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;317;866.1134,1028.635;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;268;1154.738,1076.034;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;252;-576.426,33.90091;Inherit;True;Alpha Erosion Normalized;2;;86;8a160eda83cc1f24086b118ced78436f;0;2;1;FLOAT;0;False;11;FLOAT;0;False;2;FLOAT;0;FLOAT;13
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;36;-737.4224,-254.0688;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;76;425.4064,-83.42751;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;300;2216.123,315.4415;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;362;583.3381,2227.117;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;266;2398.196,1074.171;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;288;1264.615,1998.358;Inherit;False;1317.389;915.5375;Comment;17;272;275;278;276;277;279;273;271;280;281;274;286;287;347;368;369;370;Vertex Offset;1,1,1,1;0;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;303;2432.123,334.4415;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;307;2471.432,542.7118;Inherit;False;Property;_Trail;Trail;64;2;[Header];[Toggle];Create;True;1;TRAIL;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;363;806.9379,2237.516;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;365;819.938,2453.317;Inherit;False;Property;_Vertexoffsetsize;Vertex offset size;61;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;228;1420.906,135.9922;Inherit;False;Property;_Alpha;Alpha;10;0;Create;True;0;0;0;False;0;False;1;10;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;84;1031.62,-39.1684;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;433;4295.758,1232.8;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;426;4031.764,1196.186;Inherit;False;Global;_Global_Faction;_Global_Faction;193;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;306;2641.732,94.21181;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;276;1686.391,2674.988;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;360;790.038,1950.217;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;367;1025.338,2344.117;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;366;691.2379,2097.116;Inherit;False;Property;_VertexoffsetinWorldSpace;Vertex offset in World Space;59;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;167;1686.48,-26.33967;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;420;3265.836,229.552;Inherit;False;Global;_Global_Admech_View;_Global_Admech_View;0;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;421;3265.836,309.552;Inherit;False;Global;_Global_Necron_View;_Global_Necron_View;0;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;434;4333.306,1120.157;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;435;4607.792,1178.421;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;440;4076.179,889.8116;Inherit;False;Property;_Activeforfaction;Active for faction;1;1;[Enum];Create;True;0;3;Admech;0;Necron;1;Votann;2;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;305;2739.233,-55.2882;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;287;1319.875,2624.645;Inherit;False;Property;_VertexoffsetfromAlpha;Vertex offset from Alpha;58;2;[Header];[Toggle];Create;True;1;VERTEX OFFSET;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;277;1888.183,2767.637;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;279;1894.654,2839.896;Inherit;False;Constant;_Float4;Float 4;31;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;361;1053.938,2016.517;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.VertexColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;274;1400.686,2421.372;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;422;3546.836,259.552;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;437;4725.613,1179.716;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;438;4641.455,1026.936;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;271;1314.615,2048.358;Inherit;True;Property;_VertexoffsetTexture;Vertex offset Texture;60;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;281;1600.411,2162.676;Inherit;False;Constant;_Float5;Float 5;31;0;Create;True;0;0;0;False;0;False;-0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;286;1757.269,2434.891;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;278;2066.13,2698.615;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;369;2104.338,2533.917;Inherit;False;Constant;_Float8;Float 8;45;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;370;1953.538,2609.317;Inherit;False;Property;_Vertexoffsetgradient;Vertex offset gradient;63;1;[Toggle];Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;316;3238.809,-43.74287;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;424;3704.836,125.552;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;425;3784.836,237.552;Inherit;False;Property;_onlyinNoosphere;only in Noosphere;66;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;431;4585.174,1657.323;Inherit;False;Property;_AppearsonlyforspecificFaction;Appears only for specific Faction ;0;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;436;5046.71,1086.494;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;314;1157.416,-469.1577;Inherit;False;692.2679;282.4185;Comment;4;163;164;165;378;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;96;-1532.851,-648.3832;Inherit;False;576.5099;566.0585;Comment;2;94;95;Luminance is alpha;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;75;-6868.871,444.433;Inherit;False;1186.948;441.3734;Comment;7;6;11;8;74;7;10;12;Deformation;1,1,1,1;0;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;275;1932.579,2401.018;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;273;1636,2301.798;Inherit;False;Property;_VertexOffsetintensity;Vertex Offset intensity;62;0;Create;True;0;0;0;False;0;False;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;280;1738.455,2108.752;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;368;2300.638,2527.417;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;423;3979.836,19.55203;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;430;5341.872,1391.889;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;12;-5806.446,489.7321;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;10;-6003.447,606.7318;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;7;-6537.593,600.531;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,0.1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;74;-6760.32,723.0513;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;8;-6357.475,572.0318;Inherit;True;Property;_Noise;Noise;41;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;11;-6282.647,773.932;Float;False;Property;_DeformationIntensity;Deformation Intensity;53;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;6;-6818.871,494.433;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;92;-271.9531,-682.1136;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;4;-614.5317,-771.1;Float;False;Property;_Color;Color;4;0;Create;True;0;0;0;False;0;False;1,1,1,1;0.9575471,1,0.9965764,1;False;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.VertexColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;93;-535.4203,-529.2395;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;187;-3670.043,1089.341;Inherit;True;Property;_masks;masks;42;0;Create;True;0;0;0;False;0;False;-1;62a80927ab5b39741a5819d51215b64a;80888d91267b47642821547ca0eb20e3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;190;-3201.043,1361.341;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;189;-3460.043,1344.341;Inherit;False;Property;_Float2;Float 2;43;1;[Enum];Create;True;0;5;A;0;R;1;G;2;B;3;RGB;4;0;False;0;False;0;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;188;-3221,1020;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;191;-2914.043,1212.341;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;196;-3063.043,1308.341;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;193;-2626.043,1463.341;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;198;-2407.043,1677.341;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;194;-3079.043,1580.341;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;199;-2980.043,1750.341;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;197;-2816.043,1552.341;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;200;-2777.043,1744.341;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;173;-636.5276,1829.868;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;176;-32.04819,1650.04;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;177;-41.04819,1882.04;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;178;-385.0482,1666.04;Inherit;False;Constant;_PositiveUGradient;Positive U Gradient;19;0;Create;True;0;0;0;False;0;False;1;0;0.001;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;181;-348.0482,1763.04;Inherit;False;Constant;_NegativeUGradient;Negative U Gradient;19;0;Create;True;0;0;0;False;0;False;1;0;0.001;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;175;-379.0482,1869.04;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;179;-558.0482,2182.04;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;182;-315.0482,2110.04;Inherit;False;Constant;_UGradient2;Negative U Gradient;19;0;Create;True;0;0;0;False;0;False;1;0;0.001;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;139;921.3516,-292.7233;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;304;1730.223,599.0414;Inherit;False;Property;_TrailPosition;Trail Position;65;0;Create;True;0;0;0;False;0;False;-1;-1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;28;2529.982,-594.9911;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2;2061.032,-427.2072;Float;False;Property;_Intensity;Intensity;8;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;169;2072.371,-333.4659;Inherit;False;Constant;_Float1;Float 1;19;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;313;1860.828,-631.4676;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;315;1575.528,-230.4138;Inherit;False;Property;_UseGradientascolor;Use Gradient as color;5;1;[Toggle];Create;True;1;;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;163;1525.663,-425.7145;Inherit;True;Property;_ColorGradient;Color Gradient;7;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.HDEmissionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;168;2233.169,-646.5226;Inherit;False;Luminance;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;272;2118.741,2127.874;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;347;1591.267,2392.578;Inherit;False;Constant;_Float6;Float 6;42;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;364;962.938,2244.016;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;164;1384.975,-399.531;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;165;1259.416,-406.9604;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;378;1230.663,-247.7683;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;379;1242.663,-92.76831;Inherit;False;Property;_ColorGradientadjust;Color Gradient adjust;6;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;94;-1135.042,-612.6832;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;95;-1353.701,-524.2202;Inherit;False;Constant;_Float0;Float 0;10;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;81;-1567.568,-772.6949;Inherit;False;Property;_SolidColorinsteadofRGB;Solid Color instead of RGB;44;1;[Toggle];Create;True;0;2;Option1;0;Option2;1;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;72;-4206.206,91.97516;Inherit;False;Time Since Startup;-1;;87;a8ff45d5ee98154449a784d6b14a8420;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;415;-4273.203,-767.0775;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;417;3515.552,-271.368;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;418;3293.187,-253.2493;Inherit;False;Constant;_Float9;Float 9;55;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;419;3270.127,-167.5974;Inherit;False;Constant;_Float10;Float 10;55;0;Create;True;0;0;0;False;0;False;1E+07;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;442;4233.891,29.10513;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;312;3194.959,88.2563;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;13;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;MotionVectors;0;5;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefMV;255;False;;255;True;_StencilWriteMaskMV;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=MotionVectors;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;143;1261.76,-236.7392;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;13;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;ShadowCaster;0;1;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;144;1261.76,-236.7392;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;13;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;META;0;2;META;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;145;1261.76,-236.7392;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;13;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;146;1261.76,-236.7392;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;13;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;DepthForwardOnly;0;4;DepthForwardOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=DepthForwardOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;148;1261.76,-236.7392;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;13;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;DistortionVectors;0;6;DistortionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;4;1;False;;1;False;;1;1;False;;1;False;;True;1;False;;1;False;;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDistortionVec;255;False;;255;True;_StencilWriteMaskDistortionVec;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;False;True;1;LightMode=DistortionVectors;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;149;1261.76,-236.7392;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;13;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=Picking;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;142;4653.476,-15.46045;Float;False;True;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;13;Codex/VFX/VFX;7f5cb9c3ea6481f469fdd856555439ef;True;Forward Unlit;0;0;Forward Unlit;11;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Transparent=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps5;switch;0;False;False;False;False;True;3;1;False;;10;False;;0;1;False;;0;False;;False;False;True;1;1;False;;0;True;_DstBlend2;0;1;False;;0;False;;False;False;True;1;1;False;;0;True;_DstBlend2;0;1;False;;0;False;;False;False;False;True;0;True;_CullModeForward;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVel;False;False;False;False;False;True;True;0;True;_StencilRef;255;False;;255;True;_StencilWriteMask;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;0;True;_ZWrite;True;0;True;_ZTestDepthEqualForOpaque;False;True;1;LightMode=ForwardOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;33;Surface Type;1;638288378993614790;  Rendering Pass ;0;0;  Rendering Pass;1;0;  Blending Mode;0;0;  Receive Fog;1;0;  Distortion;0;638458614474629847;    Distortion Mode;0;0;    Distortion Only;1;0;  Depth Write;1;0;  Cull Mode;0;0;  Depth Test;4;0;Double-Sided;1;638314041702749247;Alpha Clipping;0;0;Receive Decals;1;0;Motion Vectors;0;638982197016687958;  Add Precomputed Velocity;0;638458614399965961;Shadow Matte;0;0;Cast Shadows;1;0;Write Depth;0;0;  Depth Offset;0;0;  Conservative;0;0;GPU Instancing;1;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position;1;0;LOD CrossFade;0;0;0;8;True;True;True;True;True;False;False;True;False;;False;0
WireConnection;220;0;218;3
WireConnection;220;1;218;4
WireConnection;219;0;218;1
WireConnection;219;1;218;2
WireConnection;217;0;219;0
WireConnection;217;1;220;0
WireConnection;388;0;387;1
WireConnection;388;1;387;3
WireConnection;292;0;291;4
WireConnection;212;0;217;0
WireConnection;212;2;226;0
WireConnection;389;0;388;0
WireConnection;389;1;390;0
WireConnection;416;0;292;0
WireConnection;392;0;212;0
WireConnection;392;1;389;0
WireConnection;392;2;391;0
WireConnection;295;0;416;0
WireConnection;295;1;296;0
WireConnection;290;1;295;0
WireConnection;290;2;293;0
WireConnection;211;1;392;0
WireConnection;294;0;211;1
WireConnection;210;0;208;3
WireConnection;210;1;208;4
WireConnection;209;0;208;1
WireConnection;209;1;208;2
WireConnection;414;12;230;0
WireConnection;412;0;290;0
WireConnection;372;7;322;0
WireConnection;88;0;209;0
WireConnection;88;1;210;0
WireConnection;221;0;414;0
WireConnection;221;1;223;0
WireConnection;223;0;294;0
WireConnection;223;1;222;0
WireConnection;223;2;224;0
WireConnection;223;3;412;0
WireConnection;373;0;372;0
WireConnection;373;1;372;13
WireConnection;373;2;374;0
WireConnection;227;0;88;0
WireConnection;227;1;223;0
WireConnection;229;0;221;0
WireConnection;229;1;209;0
WireConnection;151;0;373;0
WireConnection;151;1;152;0
WireConnection;331;0;325;1
WireConnection;335;0;325;2
WireConnection;125;0;227;0
WireConnection;125;1;229;0
WireConnection;125;2;126;0
WireConnection;382;0;381;1
WireConnection;382;1;381;3
WireConnection;37;0;151;0
WireConnection;329;0;325;1
WireConnection;329;1;338;0
WireConnection;332;0;331;0
WireConnection;332;1;340;0
WireConnection;333;0;325;2
WireConnection;333;1;341;0
WireConnection;334;0;335;0
WireConnection;334;1;342;0
WireConnection;97;0;125;0
WireConnection;97;2;225;0
WireConnection;384;0;382;0
WireConnection;384;1;385;0
WireConnection;375;0;37;0
WireConnection;343;0;329;0
WireConnection;344;0;332;0
WireConnection;345;0;333;0
WireConnection;346;0;334;0
WireConnection;380;0;97;0
WireConnection;380;1;384;0
WireConnection;380;2;386;0
WireConnection;406;0;401;0
WireConnection;406;1;407;0
WireConnection;405;0;403;0
WireConnection;405;1;407;0
WireConnection;404;0;402;0
WireConnection;404;1;407;0
WireConnection;243;0;3;4
WireConnection;40;0;42;0
WireConnection;376;0;375;0
WireConnection;376;1;377;0
WireConnection;336;0;343;0
WireConnection;336;1;344;0
WireConnection;336;2;345;0
WireConnection;336;3;346;0
WireConnection;399;0;380;0
WireConnection;399;1;404;0
WireConnection;398;0;380;0
WireConnection;398;1;405;0
WireConnection;397;0;380;0
WireConnection;397;1;406;0
WireConnection;170;0;243;0
WireConnection;170;1;249;0
WireConnection;309;0;308;4
WireConnection;91;0;40;0
WireConnection;86;1;376;0
WireConnection;86;2;87;0
WireConnection;393;0;336;0
WireConnection;393;1;394;0
WireConnection;13;0;27;0
WireConnection;13;1;397;0
WireConnection;395;0;27;0
WireConnection;395;1;398;0
WireConnection;396;0;27;0
WireConnection;396;1;399;0
WireConnection;244;0;170;0
WireConnection;245;0;3;4
WireConnection;245;1;246;0
WireConnection;311;0;309;0
WireConnection;172;0;91;0
WireConnection;239;0;86;0
WireConnection;357;0;358;0
WireConnection;357;1;393;0
WireConnection;357;2;359;0
WireConnection;408;0;13;1
WireConnection;408;1;395;2
WireConnection;408;2;396;3
WireConnection;408;3;13;4
WireConnection;104;0;245;0
WireConnection;104;1;239;0
WireConnection;104;2;357;0
WireConnection;302;0;297;1
WireConnection;302;1;311;0
WireConnection;89;1;172;0
WireConnection;89;2;90;0
WireConnection;248;0;244;0
WireConnection;248;1;239;0
WireConnection;248;2;357;0
WireConnection;267;0;317;0
WireConnection;411;13;408;0
WireConnection;299;0;302;0
WireConnection;317;0;89;0
WireConnection;268;0;267;0
WireConnection;268;1;269;0
WireConnection;252;1;411;0
WireConnection;252;11;248;0
WireConnection;36;0;411;0
WireConnection;36;1;104;0
WireConnection;76;0;36;0
WireConnection;76;1;252;13
WireConnection;76;2;77;0
WireConnection;300;0;299;0
WireConnection;300;1;302;0
WireConnection;300;2;301;0
WireConnection;266;0;317;0
WireConnection;266;1;268;0
WireConnection;266;2;270;0
WireConnection;303;0;300;0
WireConnection;363;0;362;1
WireConnection;363;1;362;3
WireConnection;84;0;76;0
WireConnection;84;1;266;0
WireConnection;433;0;426;0
WireConnection;306;1;303;0
WireConnection;306;2;307;0
WireConnection;367;0;363;0
WireConnection;367;1;365;0
WireConnection;167;0;84;0
WireConnection;167;1;228;0
WireConnection;434;0;426;0
WireConnection;435;0;440;0
WireConnection;435;1;433;0
WireConnection;305;0;167;0
WireConnection;305;1;306;0
WireConnection;277;0;276;1
WireConnection;361;0;360;0
WireConnection;361;1;367;0
WireConnection;361;2;366;0
WireConnection;422;0;420;0
WireConnection;422;1;421;0
WireConnection;437;0;435;0
WireConnection;438;0;440;0
WireConnection;438;1;434;0
WireConnection;271;1;361;0
WireConnection;286;1;274;4
WireConnection;286;2;287;0
WireConnection;278;0;276;1
WireConnection;278;1;277;0
WireConnection;278;2;279;0
WireConnection;316;0;305;0
WireConnection;424;0;316;0
WireConnection;424;1;422;0
WireConnection;436;0;438;0
WireConnection;436;1;437;0
WireConnection;275;0;286;0
WireConnection;280;0;271;0
WireConnection;280;1;281;0
WireConnection;368;0;369;0
WireConnection;368;1;278;0
WireConnection;368;2;370;0
WireConnection;423;0;316;0
WireConnection;423;1;424;0
WireConnection;423;2;425;0
WireConnection;430;1;436;0
WireConnection;430;2;431;0
WireConnection;12;0;6;0
WireConnection;12;1;10;0
WireConnection;10;0;8;1
WireConnection;10;1;11;0
WireConnection;7;0;6;0
WireConnection;7;1;74;0
WireConnection;8;1;7;0
WireConnection;92;0;4;0
WireConnection;92;1;94;0
WireConnection;92;2;93;0
WireConnection;190;0;189;0
WireConnection;188;0;187;4
WireConnection;188;1;187;1
WireConnection;188;2;189;0
WireConnection;191;0;188;0
WireConnection;191;1;187;2
WireConnection;191;2;196;0
WireConnection;196;0;190;0
WireConnection;193;0;191;0
WireConnection;193;1;187;3
WireConnection;193;2;197;0
WireConnection;198;0;193;0
WireConnection;198;1;187;0
WireConnection;198;2;200;0
WireConnection;194;0;189;0
WireConnection;199;0;189;0
WireConnection;197;0;194;0
WireConnection;200;0;199;0
WireConnection;176;0;173;1
WireConnection;177;0;175;0
WireConnection;175;0;173;1
WireConnection;179;0;173;2
WireConnection;28;1;168;0
WireConnection;313;0;92;0
WireConnection;313;1;163;0
WireConnection;313;2;315;0
WireConnection;163;1;164;0
WireConnection;168;0;313;0
WireConnection;168;1;2;0
WireConnection;168;2;169;0
WireConnection;272;0;280;0
WireConnection;272;1;273;0
WireConnection;272;2;275;0
WireConnection;272;3;368;0
WireConnection;364;0;363;0
WireConnection;164;0;165;0
WireConnection;165;0;378;0
WireConnection;378;0;84;0
WireConnection;378;1;379;0
WireConnection;94;0;408;0
WireConnection;94;1;95;0
WireConnection;94;2;411;19
WireConnection;417;0;168;0
WireConnection;417;1;418;0
WireConnection;417;2;419;0
WireConnection;442;0;423;0
WireConnection;442;1;430;0
WireConnection;142;0;417;0
WireConnection;142;2;442;0
WireConnection;142;6;272;0
ASEEND*/
//CHKSM=9E7D3E1E5B9C1ACA2B2DAE922994983DA15E699A