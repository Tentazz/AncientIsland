using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class GlobalVariables : MonoBehaviour {
    public static float globalTime;
    public static float globalNormalizedTime;

    private void Start() {
        Shader.SetGlobalFloat("_globalNormalizedTime", globalNormalizedTime);
    }

    private void Update() {
        Shader.SetGlobalFloat("_globalNormalizedTime", globalNormalizedTime);
    }

}
