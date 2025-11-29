using Sirenix.OdinInspector;
using Unity.VisualScripting;
using UnityEditor;
using UnityEngine;
using UnityEngine.InputSystem;


public class TimeManager : MonoBehaviour
{
    public float dayDuration = 300f;
    public float initialHour = 10f;

    public Gradient lightColorGradient;
    public AnimationCurve timeCurve;


    public GameObject directionnalLight;
    float sunAngle;

    public InputActionAsset InputActions;
    public InputAction NumpadPlusAction;
    public InputAction NumpadMinusAction;
    public float timeToSet;

    private void OnEnable() {
        InputActions.FindActionMap("Player").Enable(); //activer le systeme d'input du joueur
    }

    private void OnDisable() {
        InputActions.FindActionMap("Player").Disable();//desactiver le systeme d'input du joueur
    }

    private void Awake() {
        NumpadPlusAction = InputSystem.actions.FindAction("+");
        NumpadMinusAction = InputSystem.actions.FindAction("-");
    }


    private void Start() {
        GlobalVariables.globalTime = initialHour * dayDuration / 24;
    }

    void Update() 
    {

        if (NumpadPlusAction.IsPressed()) 
        {
            GlobalVariables.globalTime += Time.deltaTime * 60f;
        }

        else 
        {
            GlobalVariables.globalTime += Time.deltaTime;
        }

        if (NumpadMinusAction.IsPressed()) {
            GlobalVariables.globalTime += Time.deltaTime * -60f;
            if (GlobalVariables.globalTime < 0f) {
                GlobalVariables.globalTime = dayDuration + GlobalVariables.globalTime;
            }
        }

        GlobalVariables.globalNormalizedTime = GlobalVariables.globalTime / dayDuration;

        //print(GlobalVariables.globalNormalizedTime);

        if (GlobalVariables.globalTime >= dayDuration) // Reset the day cycle
        {
            GlobalVariables.globalTime = 0f;
            // Trigger day-night cycle events here
            Debug.Log("A new day has begun!");
        }
         UpdateLightPosition();

    }

    [Button("SetTime")]
    private void SetTime() {
        GlobalVariables.globalTime = timeToSet * dayDuration / 24;
        GlobalVariables.globalNormalizedTime = GlobalVariables.globalTime / dayDuration;
        UpdateLightPosition();
        GlobalVariables.SendGlobalToShaders();
        print("Time set to: " + timeToSet + " hours.");
    }

    private void UpdateLightPosition() {
        // Update lighting based on time of day
        Light lightComponent = directionnalLight.GetComponent<Light>();

        if (lightComponent != null) {
            lightComponent.color = lightColorGradient.Evaluate(timeCurve.Evaluate(GlobalVariables.globalNormalizedTime));
        }

        // Update the rotation of the directional light to simulate sun movement
        sunAngle = timeCurve.Evaluate(GlobalVariables.globalNormalizedTime) * 360f;
        //sunAngle = GlobalVariables.globalNormalizedTime * 360f;
        directionnalLight.transform.localRotation = Quaternion.Euler(new Vector3(sunAngle - 90f, 0f, 0f));
    }
}


