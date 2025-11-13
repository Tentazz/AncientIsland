// Made with Amplify Shader Editor v1.9.9.4
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "PixelateShader"
{
    Properties
    {
        
    }

    SubShader
    {
		LOD 0

        
		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend Off
		AlphaToMask Off
		Cull Back
		ColorMask RGBA
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		
		
        Pass
        {
			Name "Custom RT Init"
            CGPROGRAM
            #define ASE_VERSION 19904

            #include "UnityCustomRenderTexture.cginc"

            #pragma vertex ASEInitCustomRenderTextureVertexShader
            #pragma fragment frag
            #pragma target 3.5
			

			struct ase_appdata_init_customrendertexture
			{
				float4 vertex : POSITION;
				float4 texcoord : TEXCOORD0;
				
			};

			// User facing vertex to fragment structure for initialization materials
			struct ase_v2f_init_customrendertexture
			{
				float4 vertex : SV_POSITION;
				float2 texcoord : TEXCOORD0;
				float3 direction : TEXCOORD1;
				
			};

			

			ase_v2f_init_customrendertexture ASEInitCustomRenderTextureVertexShader (ase_appdata_init_customrendertexture v )
			{
				ase_v2f_init_customrendertexture o;
				
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.texcoord = float3(v.texcoord.xy, CustomRenderTexture3DTexcoordW);
				o.direction = CustomRenderTextureComputeCubeDirection(v.texcoord.xy);
				return o;
			}

            float4 frag(ase_v2f_init_customrendertexture IN ) : COLOR
            {
                float4 finalColor;
				
                finalColor = float4(1,1,1,1);
				return finalColor;
            }
            ENDCG
        }
    }
	
	CustomEditor "AmplifyShaderEditor.MaterialInspector"
	Fallback Off
}
/*ASEBEGIN
Version=19904
Node;AmplifyShaderEditor.ScreenPosInputsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;8;-896,-48;Float;False;1;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;10;-704,0;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;12;-528,16;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FloorOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;11;-352,0;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;13;-224,0;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;15;-544,368;Inherit;False;Constant;_Vector0;Vector 0;1;0;Create;True;0;0;0;False;0;False;640,360;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;9;-32,-48;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;white;Auto;True;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;16;352,-48;Float;False;True;-1;3;AmplifyShaderEditor.MaterialInspector;0;1;PixelateShader;6ce779933eb99f049b78d6163735e06f;True;Custom RT Init;0;0;Custom RT Init;1;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;False;0;;0;0;Standard;0;0;1;True;False;;False;0
WireConnection;10;0;8;1
WireConnection;10;1;8;2
WireConnection;12;0;10;0
WireConnection;12;1;15;0
WireConnection;11;0;12;0
WireConnection;13;0;11;0
WireConnection;13;1;15;0
WireConnection;9;1;13;0
ASEEND*/
//CHKSM=2B31B9BBF6D369EF02390B32864BA737E6BB2B31