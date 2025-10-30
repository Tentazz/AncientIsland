using Unity.VisualScripting;
using UnityEngine;

public class LightReactToTime : MonoBehaviour
{


    public AnimationCurve intensityOverTime;
    private float initialIntensity;


    void Start()
    {
        initialIntensity = this.GetComponent<Light>().intensity;
    }

    // Update is called once per frame
    void Update()
    {
        this.GetComponent<Light>().intensity = intensityOverTime.Evaluate(GlobalVariables.globalNormalizedTime) * initialIntensity;
    }
}
