Shader "An/FirstShader"{
	Properties{
		_Thick ("Small", Float) = 1.0
		_Color ("Color", Color) = (1.0,1.0,1.0,1.0)
        _CutoutThresh("Cutout Threshold", Range(0.005,0.05)) = 0.01
	}
	SubShader{
		Tags{"Queue"="Transparent" "RenderType"="Transparent" }
		LOD 100
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha
		Pass{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			struct appdata{
				float4 vertex : POSITION;
                float2 uv : TEXCOORD0; // texture coordinate
			};

			struct v2f{
                float2 uv : TEXCOORD0; // texture coordinate
				float4 vertex : SV_POSITION;
			};

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }
            half _Thick;
            float _CutoutThresh;
            half4 _Color;
            fixed4 frag (v2f i) : SV_Target
            {
            	float4 ou;
            	float coe = (i.uv.x * (1 - i.uv.x))* (i.uv.y * (1 - i.uv.y)) *_Thick;
            	//ou.a = 1 - coe;
            	ou.r = (1 - coe) * _Color.r;
            	ou.b = (1 - coe) * _Color.b;
            	ou.g = (1 - coe) * _Color.g;
            	ou.a = (1 - coe);
                clip(ou.a - (_Thick * _CutoutThresh));
            	return ou;
            }
            ENDCG
		}
	}
}