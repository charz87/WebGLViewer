Shader "Custom/caustics" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_caustics ("caustics", 2D) = "white" {}
		_causticsRvr ("caustics",2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;
		sampler2D _caustics;
		sampler2D _causticsRvr;

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex);
			float2 uv = IN.uv_MainTex  * .2;
			float2 uv2 = uv;
			uv.x += _Time;
			uv2.y += _Time;
			half4 caus = tex2D (_caustics, uv);
			half4 caus2 = tex2D (_causticsRvr, uv2);
			o.Albedo = c.rgb + caus.rgb + caus2 ;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
