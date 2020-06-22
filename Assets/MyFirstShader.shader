Shader "Holistic/HelloShader"  // gives shader a name and tells unity where to put it liek a folder where to find shader in amteril inspector
{

    Properties // Properties 
    {
        _myColor ("Example Colour", Color) = (1, 1, 1, 1)   //decalring input fields as a variables to use in shader processing
        _myEmission("Example Emission", Color) = (1 ,1 ,1, 1)
        _myNormal("Example Normal", Color)=(1,1,1,1)
    } 

    SubShader { //shader processing code to take the input properties with model geometry information to process the effect
    	CGPROGRAM
    	#pragma surface surf Lambert // compiler directive telling unity how the code will be use for example surface indicating that I will be using surface shader followed by the function name and then the lightinh type

    	struct Input // declaring any values from the mesh that I need to mainpulate. Its basically getting hold of the mesh data or putting my hands on it to manipulate it 
    	{
    		float2 uvMainTex;
    	};

    	fixed4 _myColor;
    	fixed4 _myEmission;
    	fixed4 _myNormal;

    	void surf (Input In, inout SurfaceOutput o)
    	{
    		o.Albedo = _myColor.rgb;
    		o.Emission = _myEmission.rgb;
    		o.Normal = _myNormal.rgb;
    	}

    	    ENDCG
    }

    	FallBack"Diffuse" // fall back functions for inferior GPUS or the graphics card might not be able to handle the code
}