Shader "Hidden/WallVisionOutlineOccluder" {
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		Pass {
			Name "Base"
			ZWrite On
			ZTest Lequal
			Cull Front
			
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			struct v2f {
    			float4 pos : POSITION;
    			float4 nz : TEXCOORD0;
			};
			
			v2f vert( appdata_base v ) {
    			v2f o;
    			o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
    			o.nz.xyz = COMPUTE_VIEW_NORMAL;
    			o.nz.w = COMPUTE_DEPTH_01;
    			return o;
			}
			
			fixed4 frag(v2f i) : COLOR {
				return EncodeDepthNormal (i.nz.w, i.nz.xyz);
			}
			ENDCG
		}
	} 
}

