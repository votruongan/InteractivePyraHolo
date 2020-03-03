 Shader "Custom/OutlineShader"
    {
        // Variables
        Properties
        {
            _MainTex("Main Texture", 2D) = "white" {}
            _AmbientOcclusion("Ambient Occlusion", 2D) = "white" {}
   
            _OutlineWidth("Outline Width", float) = 2
            _OutlineColor("Outline Color", color) = (1,1,1,1)
        }
   
        SubShader
            {
                    Tags{ "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent"}
                Pass
                {
   
                    ZWrite Off
   
                    Blend SrcAlpha OneMinusSrcAlpha
   
                    CGPROGRAM
                    #pragma vertex vertexFunction
                    #pragma fragment fragmentFunction
   
                    #include "UnityCG.cginc"
   
                    struct appdata {
                        fixed4 vertex : POSITION;
                        fixed3 normal : NORMAL;
                    };
   
                    struct v2f {
                        float4 position : SV_POSITION;
                    };
   
                    float _OutlineWidth;
                    float4 _OutlineColor;
   
                    v2f vertexFunction(appdata IN)
                    {
                        v2f OUT;
   
                        OUT.position = UnityObjectToClipPos(IN.vertex + IN.normal * _OutlineWidth);
                        return OUT;
                    }
   
                    fixed4 fragmentFunction(v2f IN) : COLOR
                    {
                        return _OutlineColor;
                    }
                    ENDCG
                }
   
                Pass
                {
                    CGPROGRAM
                    #pragma vertex vertFunction
                    #pragma fragment frag
   
                    struct appdata {
                        fixed4 vertex : POSITION;
                        fixed2 uv : TEXCOORD0;
                    };
   
                    struct v2f {
                        fixed4 position : SV_POSITION;
                        fixed2 texcoord : TEXCOORD0;
                    };
   
                    sampler2D _MainTex;
                    sampler2D _AmbientOcclusion;
   
                    v2f vertFunction(appdata IN)
                    {
                        v2f OUT;
   
                        OUT.position = UnityObjectToClipPos(IN.vertex);
                        OUT.texcoord = IN.uv;
   
                        return OUT;
                    }
   
                    fixed4 frag(v2f IN) : SV_Target
                    {
                        fixed4 mainTextureColor = tex2D(_MainTex, IN.texcoord);
                     
                        fixed4 endColor = mainTextureColor;
                        return endColor;
                    }
                    ENDCG
                }
             
            }
        }
 