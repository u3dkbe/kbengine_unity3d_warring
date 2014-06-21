Shader "Hidden/WallVisionOutlineCombine" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Silhouette ("Silhouette Texture", 2D) = "red" {}
		_PatternTex ("Pattern (R)", 2D) = "white" {}
		_Occluder ("Occluder Texture", 2D) = "blue" {}
		_Color ("Color", Color) = (0.0, 0.5, 1.0, 1.0)
		_GlowStrength ("Glow strength", Range (0,1.0)) = 0.2
		_PatternScale ("Pattern scale factor", Range(0,1.0)) = 1.0
		_PatternWeight ("Pattern weight", Range(0,1.0)) = 1.0
		_Aspect ("Aspect Ratio", float) = 1.0
		_RampTex("Ramp Texture", 2D) = "white" {}
	}
	
	// Shader code pasted into all further CGPROGRAM blocks	
	CGINCLUDE
	#include "UnityCG.cginc"
	
	struct v2f {
		float4 pos : POSITION;
		float2 uv : TEXCOORD0;
	};
	
	uniform sampler2D _MainTex;
	uniform sampler2D _Silhouette;
	uniform sampler2D _Occluder;
	uniform sampler2D _PatternTex;
	uniform sampler2D _RampTex;
	uniform float _GlowStrength;
	uniform float _PatternScale;
	uniform float _PatternWeight;
	uniform half4 _Color;
	uniform float _Aspect;
	
	sampler2D _CameraDepthNormalsTexture;
		
	v2f vert( appdata_img v ) 
	{
		v2f o;
		o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
		
		float2 uv = v.texcoord.xy;
		o.uv = uv;
						 
		return o;
	} 
	
	half4 frag(v2f i) : COLOR 
	{	
		float outlineDepth, sceneDepth;
		float3 outlineNorm, sceneNorm;
		
		DecodeDepthNormal(tex2D(_Silhouette, i.uv), outlineDepth, outlineNorm);
		DecodeDepthNormal(tex2D(_Occluder, i.uv), sceneDepth, sceneNorm);
		
		float4 scene = tex2D(_MainTex, i.uv);
		half4 pattern = tex2D(_PatternTex, float2(i.uv.x/_PatternScale, i.uv.y/(_PatternScale*_Aspect)));
		if (sceneDepth > 0 && outlineDepth > 0 && outlineDepth > sceneDepth) {
			//float factor = pow(1-dot(float3(0,0,1),outlineNorm), 3);
			//float factor = 1-dot(float3(0,0,1),outlineNorm);
			float factor = tex2D(_RampTex, float2(dot(float3(0,0,1),outlineNorm), 0.0)).a;
			return half4(lerp(scene.rgba, half4(_Color.r ,_Color.g ,_Color.b, _GlowStrength), 
						 lerp(factor, factor*pattern.r, _PatternWeight)));
		}
		else
			return scene;
	
		
	}
	
	ENDCG 
	
	SubShader {
		Pass {
	  		ZTest Always
	  		Cull Off 
	  		ZWrite Off
	  		Fog { Mode off }      

      		CGPROGRAM
      		#pragma vertex vert
      		#pragma fragment frag
      		ENDCG
  		}
	} 
	FallBack off
}
