using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class GlobalVariables : MonoBehaviour {
    public static float globalTime;
    public static float globalNormalizedTime;

    private void Start() {
        SendGlobalToShaders();
    }

    private void Update() {
        SendGlobalToShaders();
    }

    static public void SendGlobalToShaders () {
        Shader.SetGlobalFloat("_globalNormalizedTime", globalNormalizedTime);
    }

}
