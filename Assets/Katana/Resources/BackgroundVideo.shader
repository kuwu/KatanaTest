// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'


Shader "BackgroundVideo"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white" {}
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"
			
			struct vertInput
			{
				float4 pos : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct vertOutput
			{
				float2 uv : TEXCOORD0;
				float4 pos : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;

			vertOutput vert (vertInput input)
			{
				vertOutput output;
				output.uv = input.uv;
				output.pos = UnityObjectToClipPos(input.pos);
				return output;
			}
			
			fixed4 frag (vertOutput output) : SV_Target
			{
				return tex2D(_MainTex, output.uv);
			}
			ENDCG
		}
	}
}
