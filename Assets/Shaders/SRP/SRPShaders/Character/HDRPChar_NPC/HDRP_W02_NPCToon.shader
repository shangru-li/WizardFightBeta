Shader "W02/HDRP_W02_NPCToon"
{
    Properties
    {
        _DebugID("Debug ID", int) = 0
        [Header(COLOR)]
		_Color("Main Color", Color) = (1,1,1,1)
		_FlickColor("Flick Color", Color) = (0,0,0,0)
		_MainTex("Diffuse", 2D) = "white" {}
		_LowLightTex("Diffuse01", 2D) = "white" {}
		
        [Header(MAT BLEND)]
		[Toggle(MAT_BLEND)] MAT_BLEND("Mat Blend", Float) = 0    //�������ʵ���
		_Lerp("Lerp",range(0,1))=1      //����ϵ��
		_Diffuse02("Diffuse02", 2D) = "white" {}
		_Diffuse03("Diffuse03", 2D) = "white" {}
		_Mask("Mask", 2D) = "white" {}
		
        [Header(CUSTOMSPEC)]
		[Toggle(CUSTOMSPEC_ON)] CUSTOMSPEC_ON("Custom Specular", Float) = 0
		_customspecpower("Custom Spec Power",range(0,1))=1           //�Զ���߹�ǿ��
		_customspecrange("Custom Spec Range",range(0,1)) = 1         //�Զ���߹ⷶΧ
		[HDR]_customspecColor("Custom Spec Color",Color) = (1,1,1,1) //�Զ���߹���ɫ
		//_GlobalIntensity("GlobalIntensity",range(0,1)) = 1


		[Header(METAL)]
		[MaterialToggle]_MetalMask("Metal Mask",int) = 1            // Diffuse01��alphaͨ���Ƿ����Metal Mask
		//[HideInInspector]_Metal("Metal",range(0,1)) = 0
        _ReflectionProbe("Reflection Probe", Cube) = "white" {}     //����̽��
		_baseColor("Base Color", Color) = (1,1,1)                   //������ɫ
		_sssColor("Shade Color",Color) = (1,1,1)                    //������ɫ
		_metalColor("Metal Color",Color) = (0.5,0.5,0.5)            //��������ɫ
		_Metallic("Metallic", Range(0,1)) = 1
		_Smoothness("Smoothness", Range(0,1)) = 0.85
		_SpecStep("Specular Step",float) = 0.35
		_SpecStepFade("Specular Step Fade",range(0.01,1)) = 0.3
		_shadowThreshold("Shadow Threshold",float) = 0.85
		_shadowThresholdFade("Shadow Threshold Fade",range(0.02,1)) = 0.15
		_shadowThreshold2("Shadow Threshold2",range(0,1))=0.2
		[HideInInspector]_metalThreshold("_metalThreshold",float) = 0.2
		[HideInInspector]_metalThresholdFade("_metalThresholdFade",range(0.05,1)) = 0.75
		_SmoothnessX("Smoothness X",Range(0,1)) = 0.5
		_SmoothnessY("Smoothness Y",Range(0,1)) = 0.5
		[HideInInspector]_specBoardLine("SpecBoardLine",  Range(0,1)) = 0.5
		[HideInInspector]_MetalMod("_MetalMod",Range(0,1)) = 1.0
		[HideInInspector]_MetalModel("_MetalModel",Range(0,1)) = 1
		_Fresnel_F_power("Rim Front Power",Range(0,1)) = 1         //�����Ե��ǿ��
		_Fresnel_B_power("Rim Back Power",Range(0,1)) = 1          //�����Ե��ǿ��

		[Header(OUTLINE)]
		_Outline("Outline Width",range(0, 10)) = 1.3		        // ������ߵĴ�ϸ�����߿��
		_OutlineColor("Outline Color",color) = (0,0,0,1)            //������ɫ
        _OutlineMin("Outline Min", float) = 1                       //�����Сϵ��
	    _OutlineMax("Outline Max", float) = 3                       //������ϵ��
		_OutlineZFactor("Outline ZFactor", range(0, 10)) = 1.23     //����Զ����ǿϵ��
		[Toggle(TANGENT_OUTLINE_ON)] TANGENT_OUTLINE("Tangent Outline", Float) = 0  // ��tangent������normal������
		
        [Header(RAMP)]
		// ɫ�ײ���
		rampVal("Ramp Val",range(0, 1)) = 0.3                   //һ��ɫ�ױ�Ե
		rampFeather("Ramp Feather",range(0, 0.1)) = 0.1         //һ��ɫ�ױ�Եƽ��
		_DarkEnvLerp("Dark Env Lerp",range(0, 1)) = 0           //��ɫ���ܻ�����Ӱ��̶�
		[Toggle(TANGENT_CALC_LIGHT_ON)] TANGENT_CALC_LIGHT("TANGENT_CALC_LIGHT", Float) = 0

		[Header(LIGHT)]
		_MainLitLerp("Main Light Lerp", range(0,1)) = 0.5       //��ɫ������Ӱ��Ȩ��
		_MainLightDir("Main Light Dir", Vector) = (0,0,0,1)     //���ⷽ��
        _MainLightIntensity("Main Light Intensity",range(0,1)) = 0.5
        //_DirLightIntensity ("DirLight Int", Range(0, 1)) = 0.2                      //ƽ�й�ǿ��
		[HideInInspector]_EnvLightLerp ("Lerp To Env Light", Range(0, 1)) = 0                                           //��պ�/Probeǿ��
		//_LightColorBlend ("Light Blend", Range(0, 1)) = 0.5                                               //�ƹ��Ϲ���ɫ


        [HideInInspector][Header(POINT LIGHT)]
        [HideInInspector]_PointLightColorIntensity ("Point Light Int", Range(0, 1)) = 1                              //�������ǿ��
		[HideInInspector]_PointLightStep ("Point Light Step", Range(0, 2)) = 0.6                                     //��ֵ
		[HideInInspector][PowerSlider(4)] _PointLightFeather ("Point Light Feather", Range(0.0001, 1)) = 0.001       //��
    
		[Header(RIM LIGHT)]
		// ��Ե��
		RimLitDir1("Rim Lit Dir", Vector) = (1,1,1,1)       //��Ե�ⷽ��
		FScale1("Rim Intensity", range(0,10)) = 0.1         //��Ե��ǿ��
		FPower1("Rim Softness", range(0,50)) = 5            //��Ե����ͳ̶�
		RimColorTex1("Rim Color Tex", 2D) = "white" {}      //�����Ե����ɫ��ͼ
		RimColor1("Rim Color", Color) = (1,1,1,1)           //�����Ե����ɫ
		
        [Header(RIM LIGHT EXTRA)]
		// ��Ե��
		[Toggle(RIMLITEXT)] RIMLITEXT("Enable", Float) = 0          //ѡ��Ч��
		[HDR]RimLitColor("RimLitColor", Color) = (1,1,1,1)          //��Ե����ɫ
		BaseLitScale("BaseLitScale", Float) = 1                     //������ɫǿ��
		RimLitIntensity("RimLitIntensity", Float) = 1               //��Ե��ǿ��
		RimLightGloss("RimLightGloss", Float) = 1                   //��Ե�ⷶΧ
		

		// �������ߺ;�����
		[Header(FACE LINE)]
		_sideHatchMask("Side Hatch Mask",2D) = "white" {}              //������Ӱ��
		_NeckLineAppear("Neck Line Appear", range(0, 1)) = 0.446       //�ྱ��Ӱ�߳������ӣ�0~1,ԽС���ֵ�Խ�磩
		_NeckLineFadeFactor("Neck Line Fade",range(0, 0.5)) = 0.1      //�ྱ��Ӱ��ƽ���̶�

		[Header(SHADOW)]
        [HideInInspector]_ShadowDirLightLerp("Lerp To DirLight Color", Range(0,1)) = 0
        [HideInInspector]_ShadowEnvLightLerp("Lerp To Env Color", Range(0, 1)) = 0
        [Toggle(_RECEIVE_HAIR_SHADOW)] _enable_hairshadow ("Receive Hair Shadow", float) = 0
        _HairShadowDistance("Hair Shadow Distance", float) = 0.005
        _HairShadowDistanceClampX("Distance XMax", Range(0,2)) = 0.5
        _HairShadowDistanceClampY("Distance YMax", Range(0,2)) = 0.5
		_CharShadowColorAtten("Hair Shadow Color",Color) = (1,1,1,1)    //����Ӱ��ɫ����
		[Toggle(_RECEIVE_OBJECT_SHADOW)] _enable_objectshadow ("Receive Object Shadow", float) = 0
        _CharShadowLightID ("Object Shadow Light ID", int) = 0


		// ����� TODO������֤
        [HideInInspector][Header(POINT LIGHT)]
        [HideInInspector]_PointLightColorIntensity ("Point Light Int", Range(0, 1)) = 1                              //�������ǿ��
		[HideInInspector]_PointLightStep ("Point Light Step", Range(0, 2)) = 0.6                                     //��ֵ
		[HideInInspector][PowerSlider(4)] _PointLightFeather ("Point Light Feather", Range(0.0001, 1)) = 0.001 

		[Header(MATCAP)]
		[Toggle(ENABLE_MATCAP)] ENABLE_MATCAP("Enable", Float) = 0   //����MatCap
		_MatCapMap("MatCap Map", 2D) = "white" {}
		_MatCapMapMask("MatCap Map Mask", 2D) = "white" {}
		
        [Header(Extra)]
		[Toggle(UI_RENDER_ON)] UI_RENDER("UI_RENDER", Float) = 0    //UI�����Ⱦ

        [Header(State)]
		[Queue] _RenderQueue ( "Queue", int) = 2000
		[Enum(UnityEngine.Rendering.CullMode)] _CullMode ("Cull Mode", int) = 2  //OFF/FRONT/BACK
		[Toggle(_)] _ZWrite ("ZWrite", Float) = 1.0
		[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Int) = 4 // Less equal
		_ZOffset ("Z Offset", float) = 0
		//[Toggle(_)] _AlphaIsTransparent ("Alpha Is Transparent", Float) = 0.0
		[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("SrcBlend", Float) = 1.0
		[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("DstBlend", Float) = 0.0
		//[PowerSlider(2)] _BloomFactor ("Bloom Factor", Range(1, 50)) = 1
		_StencilRef ("Stencil Ref", float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)] _StencilCompare ("Stencil Compare", float) = 8
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilOP ("Stencil Op", float) = 0
    }

    HLSLINCLUDE
    #pragma target 4.5

    //-------------------------------------------------------------------------------------
    // Include
    //-------------------------------------------------------------------------------------

    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
    #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
    #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
    #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

    #include "NPCToonDefine.hlsl"

    ENDHLSL
    SubShader
    {
         // This tags allow to use the shader replacement features
        Tags{ "RenderPipeline"="HDRenderPipeline" "RenderType" = "HDLitShader" }

        
        // Caution: The outline selection in the editor use the vertex shader/hull/domain shader of the first pass declare. So it should not bethe  meta pass.
        Pass
        {
            Name "GBuffer"
            Tags { "LightMode" = "GBuffer" } // This will be only for opaque object based on the RenderQueue index

            Cull [_CullMode]
            ZTest [_ZTest]

            Stencil
            {
                Ref [_StencilRef]
				Comp [_StencilCompare]
				Pass [_StencilOP]
			}

            HLSLPROGRAM

            #pragma multi_compile _ DEBUG_DISPLAY
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
            #pragma multi_compile _ SHADOWS_SHADOWMASK
            // Setup DECALS_OFF so the shader stripper can remove variants
            #pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT
            #pragma multi_compile _ LIGHT_LAYERS

        #ifndef DEBUG_DISPLAY
            // When we have alpha test, we will force a depth prepass so we always bypass the clip instruction in the GBuffer
            // Don't do it with debug display mode as it is possible there is no depth prepass in this case
            #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
        #endif

            #define SHADERPASS SHADERPASS_GBUFFER
            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/ShaderPass/LitSharePass.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitData.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassGBuffer.hlsl"

            #pragma vertex Vert
            #pragma fragment Frag

            ENDHLSL
        }

        Pass
        {
            Name "ShadowCaster"
            Tags{ "LightMode" = "ShadowCaster" }

            Cull[_CullMode]

            ZClip [_ZClip]
            ZWrite On
            ZTest LEqual

            ColorMask 0

            HLSLPROGRAM

            #define SHADERPASS SHADERPASS_SHADOWS
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/ShaderPass/LitDepthPass.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitData.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassDepthOnly.hlsl"

            #pragma vertex Vert
            #pragma fragment Frag

            ENDHLSL
        }

         Pass
        {
            Name "DepthOnly"
            Tags{ "LightMode" = "DepthOnly" }

			Cull[_CullMode]
			ZWrite [_ZWrite]
			ZTest [_ZTest]
			Offset [_ZOffset], 0
			
			Stencil
			{
				Ref [_StencilRef]
				Comp [_StencilCompare]
				Pass [_StencilOP]
			}

            HLSLPROGRAM

            // In deferred, depth only pass don't output anything.
            // In forward it output the normal buffer
            #pragma multi_compile _ WRITE_NORMAL_BUFFER
            #pragma multi_compile _ WRITE_MSAA_DEPTH

            #define SHADERPASS SHADERPASS_DEPTH_ONLY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"

            #ifdef WRITE_NORMAL_BUFFER // If enabled we need all regular interpolator
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/ShaderPass/LitSharePass.hlsl"
            #else
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/ShaderPass/LitDepthPass.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitData.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassDepthOnly.hlsl"

            #pragma vertex Vert
            #pragma fragment Frag

            ENDHLSL
        }

        Pass
        {
            Name "TransparentDepthPrepass"
            Tags{ "LightMode" = "TransparentDepthPrepass" }

            Cull[_CullMode]
            ZWrite On
            ColorMask 0

            HLSLPROGRAM

            #define SHADERPASS SHADERPASS_DEPTH_ONLY
            #define CUTOFF_TRANSPARENT_DEPTH_PREPASS
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/ShaderPass/LitDepthPass.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitData.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassDepthOnly.hlsl"

            #pragma vertex Vert
            #pragma fragment Frag

            ENDHLSL
        }

        Pass
        {

            Name "Forward"
            Tags { "LightMode" = "ForwardOnly" } 

			Cull [_CullMode]
			ZWrite [_ZWrite]
			ZTest [_ZTest]
			Offset [_ZOffset], 0
			Blend 0 [_SrcBlend] [_DstBlend]
			Blend 1 one zero
			
			Stencil
			{
				Ref [_StencilRef]
				Comp [_StencilCompare]
				Pass [_StencilOP]
			}



            HLSLPROGRAM

            #pragma multi_compile _ DEBUG_DISPLAY
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
            #pragma multi_compile _ SHADOWS_SHADOWMASK
            // Setup DECALS_OFF so the shader stripper can remove variants
            #pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT

            // Supported shadow modes per light type
            #pragma multi_compile SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH

            #pragma multi_compile USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST

            #define SHADERPASS SHADERPASS_FORWARD
            // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
            // Don't do it with debug display mode as it is possible there is no depth prepass in this case
            #if !defined(_SURFACE_TYPE_TRANSPARENT) && !defined(DEBUG_DISPLAY)
                #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
            #endif

            #pragma shader_feature_local _ _RECEIVE_HAIR_SHADOW
            #pragma shader_feature_local _ _RECEIVE_OBJECT_SHADOW

			#pragma shader_feature MAT_BLEND
			#pragma shader_feature ENABLE_MATCAP

            #pragma multi_compile_local __ RIMLITEXT



            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"

        #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
        #endif

            // The light loop (or lighting architecture) is in charge to:
            // - Define light list
            // - Define the light loop
            // - Setup the constant/data
            // - Do the reflection hierarchy
            // - Provide sampling function for shadowmap, ies, cookie and reflection (depends on the specific use with the light loops like index array or atlas or single and texture format (cubemap/latlong))

            #define HAS_LIGHTLOOP

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/HDShadow.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/ShaderPass/LitSharePass.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitData.hlsl"
            
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/VertMesh.hlsl"

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/ImageBasedLighting.hlsl"

            #include "NPCToonForwardPass.hlsl"

            #pragma vertex vert
            #pragma fragment frag

            ENDHLSL
        }

        Tags{
            "RenderType" = "Opaque"
        }
        Pass
		{
			Name "Outline"
			Cull Front
			ZWrite On
            ZTest [_ZTest]
			Offset [_ZOffset], 0
			Blend one zero

            Stencil
            {
                Ref[_StencilRef]
                Comp[_StencilComp]
                Pass[_StencilOpPass]
                //Fail[_StencilOpFail]

            }
			
			HLSLPROGRAM
			
			#pragma multi_compile SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH
            #pragma multi_compile _ TANGENT_OUTLINE_ON
			
			#pragma shader_feature_local _ _OUTLINE_ENABLE_ON
			#pragma shader_feature_local _ _ORIGINNORMAL_ON
			
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
			
			#include "NPCToonOutlinePass.hlsl"
			
			// TODO: add tessellation
            #pragma vertex vert
            #pragma fragment frag_outline
			// #pragma hull Hull
			// #pragma domain Domain
			
			ENDHLSL
			
		}


        Pass
        {
            Name "FaceDepthOnly"
            Tags{ "LightMode" = "DepthOnly" }

            ColorMask 0
			Cull Back
			ZWrite On
			ZTest LEqual
			

           HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            struct a2v
            {
                float4 positionOS: POSITION;
            };

            struct v2f
            {
                float4 positionCS: SV_POSITION;
            };


            v2f vert(a2v v)
            {
                v2f o;
                o.positionCS = TransformObjectToHClip(v.positionOS.xyz);
                return o;
            }

            half4 frag(v2f i): SV_Target
            {
                return (0, 0, 0, 1);
            }
            ENDHLSL
        }

        Pass
        {
            Name "HairSimpleColor"
            Tags { "LightMode" = "ForwardOnly" }

            Cull Off
            ZTest LEqual
            ZWrite Off

            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            struct a2v
            {
                float4 positionOS: POSITION;
            };

            struct v2f
            {
                float4 positionCS: SV_POSITION;
            };


            v2f vert(a2v v)
            {
                v2f o;
                // Or this :
                o.positionCS = TransformObjectToHClip(v.positionOS.xyz);
                return o;
            }

            half4 frag(v2f i): SV_Target
            {
                float depth = (i.positionCS.z / i.positionCS.w) * 0.5 + 0.5;
                return float4(1, depth, 0, 1);
            }
            ENDHLSL

        }
    }
}
