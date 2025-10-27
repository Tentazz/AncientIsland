using System.Security.Cryptography;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Rendering.HighDefinition;

public class VolumeFogReactToTIme : MonoBehaviour
{
    private float initialFogDensity;
    public AnimationCurve fogDensityOverTime;
    public float minFogDensity = 1000f;
    private LocalVolumetricFog localVolumetricFog;

    public Gradient colorGradient;

    void Start()
    {
        localVolumetricFog = this.GetComponent<LocalVolumetricFog>();
        initialFogDensity = localVolumetricFog.parameters.meanFreePath;
    }


    void Update()
    {
        localVolumetricFog.parameters.meanFreePath = Mathf.Lerp(initialFogDensity, minFogDensity, fogDensityOverTime.Evaluate(GlobalVariables.globalNormalizedTime));
        localVolumetricFog.parameters.albedo = colorGradient.Evaluate(GlobalVariables.globalNormalizedTime);
    }
}
