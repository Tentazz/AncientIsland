using Cinemachine;
using DG.Tweening;
using UnityEngine;
using UnityEngine.InputSystem;
using System.Collections;

public class ItemJumelles : MonoBehaviour
{

    public InputActionAsset InputActions;
    public InputAction moveAction;
    public InputAction AttackAction;
    public GameObject vignetteObject;
    private Material vignetteMaterial;

    public GameObject playerCamera;

    private bool transitioning = false;

    private float zoomLevel = 10f;

    public CinemachineVirtualCamera mainVirtualCamera;

    private Vector2 moveInput;
    private bool JumellesOn = false;
    private bool Jumellesboost = false;


    private void OnEnable() {
        InputActions.FindActionMap("Player").Enable(); //activer le systeme d'input du joueur
        JumellesOn = false;
        Jumellesboost = false;
    }

    private void OnDisable() {
        vignetteMaterial.DOFloat(0f, "_vignetteIntensity", 0.3f);
        DOTween.To(() => mainVirtualCamera.m_Lens.FieldOfView, x => mainVirtualCamera.m_Lens.FieldOfView = x, 50f, 0.3f);
        JumellesOn = false;
        Jumellesboost = false;
        playerCamera.GetComponent<MouseLook>().jumellesMultiplyier = 1f;
    }

    private void Awake() {
        AttackAction = InputSystem.actions.FindAction("Attack");
        moveAction = InputSystem.actions.FindAction("Move");
    }
    void Start()
    {
        vignetteMaterial = vignetteObject.GetComponentInChildren<Renderer>().material;
    }

    // Update is called once per frame
    void Update() {
        moveInput = moveAction.ReadValue<Vector2>(); //recuperer la valeur de l'input de deplacement


        if (AttackAction.WasReleasedThisFrame() && transitioning == false) {
            if (JumellesOn == false) {
                Debug.Log("Jumelles On");
                zoomLevel = 10f;
                //ajouter effet zoom
                DOTween.To(() => mainVirtualCamera.m_Lens.FieldOfView, x => mainVirtualCamera.m_Lens.FieldOfView = x, 13f, 0.3f);
                vignetteMaterial.DOFloat(3.6f, "_vignetteIntensity", 0.3f);
                StartCoroutine(SetJumellesOn());
                playerCamera.GetComponent<MouseLook>().jumellesMultiplyier = 0.2f;
            }

            else if (JumellesOn == true && Jumellesboost == false) {
                DOTween.To(() => mainVirtualCamera.m_Lens.FieldOfView, x => mainVirtualCamera.m_Lens.FieldOfView = x, 4f, 0.3f);
                vignetteMaterial.DOFloat(3.8f, "_vignetteIntensity", 0.3f);
                Jumellesboost = true;
                playerCamera.GetComponent<MouseLook>().jumellesMultiplyier = 0.1f;
            }

            else if (JumellesOn == true && Jumellesboost == true) {
                vignetteMaterial.DOFloat(0f, "_vignetteIntensity", 0.3f);
                DOTween.To(() => mainVirtualCamera.m_Lens.FieldOfView, x => mainVirtualCamera.m_Lens.FieldOfView = x, 50f, 0.3f);
                JumellesOn = false;
                Jumellesboost = false;
                playerCamera.GetComponent<MouseLook>().jumellesMultiplyier = 1f;
            }
        }

        /*if (JumellesOn == true) {
            //ajouter effet zoom
            //print(moveInput);
            zoomLevel = Mathf.Clamp(zoomLevel - moveInput.y/4, 5f, 20f);
            mainVirtualCamera.m_Lens.FieldOfView = zoomLevel;
        }*/
    }

    IEnumerator SetJumellesOn() {
            transitioning = true;
            yield return new WaitForSeconds(0.3f);
            JumellesOn = true;
            transitioning = false;
    }
}
