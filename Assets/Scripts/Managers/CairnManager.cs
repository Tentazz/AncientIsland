using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class CairnManager : MonoBehaviour
{
    public List<GameObject> Cairns = new List<GameObject>();
    public GameObject Cairn01;
    public GameObject player;

    public InputActionAsset InputActions;
    public InputAction InteractAction;
    public InputAction Numpad1Action;
    public InputAction Numpad2Action;
    public InputAction Numpad3Action;
    public InputAction Numpad4Action;
    public InputAction Numpad5Action;

    public CharacterController controller;

    private void OnEnable() {
        InputActions.FindActionMap("Player").Enable(); //activer le systeme d'input du joueur
    }

    private void OnDisable() {
        InputActions.FindActionMap("Player").Disable();//desactiver le systeme d'input du joueur
    }

    private void Awake() {
        InteractAction = InputSystem.actions.FindAction("Interact");
        Numpad1Action = InputSystem.actions.FindAction("1");
        Numpad2Action = InputSystem.actions.FindAction("2");
        Numpad3Action = InputSystem.actions.FindAction("3");
        Numpad4Action = InputSystem.actions.FindAction("4");
        Numpad5Action = InputSystem.actions.FindAction("5");
    }

    // Update is called once per frame
    void Update()
    {
        if (Numpad1Action.WasPressedThisFrame()) {
            controller.enabled = false; //disable character controller to avoid teleportation issues
            player.transform.position = Cairns[0].transform.position;
            controller.enabled = true; //re-enable character controller
        }

        if (Numpad2Action.WasPressedThisFrame()) {
            controller.enabled = false; //disable character controller to avoid teleportation issues
            player.transform.position = Cairns[1].transform.position;
            controller.enabled = true; //re-enable character controller
        }

        if (Numpad3Action.WasPressedThisFrame()) {
            controller.enabled = false; //disable character controller to avoid teleportation issues
            player.transform.position = Cairns[2].transform.position;
            controller.enabled = true; //re-enable character controller
        }

        if (Numpad4Action.WasPressedThisFrame()) {
            controller.enabled = false; //disable character controller to avoid teleportation issues
            player.transform.position = Cairns[3].transform.position;
            controller.enabled = true; //re-enable character controller
        }

        if (Numpad5Action.WasPressedThisFrame()) {
            controller.enabled = false; //disable character controller to avoid teleportation issues
            player.transform.position = Cairns[4].transform.position;
            controller.enabled = true; //re-enable character controller
        }

    }
}
