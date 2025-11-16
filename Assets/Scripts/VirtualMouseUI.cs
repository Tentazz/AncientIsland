using System.Xml.Serialization;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.LowLevel;
using UnityEngine.InputSystem.UI;

public class VirtualMouseUI : MonoBehaviour
{

    Vector2 virtualMousePosition = new Vector2(640 / 2, 360 / 2);

private VirtualMouseInput virtualMouseInput;

    private void Awake()
    {
        virtualMouseInput = GetComponent<VirtualMouseInput>();
    }

    private void OnEnable()
    {
        virtualMousePosition = new Vector2(640 / 2, 360 / 2);
        Cursor.lockState = CursorLockMode.None;
    }

    private void OnDisable()
    {
        Cursor.lockState = CursorLockMode.Locked;
    }

    private void Update() {
        //InputSystem.Update();
        Mouse.current.WarpCursorPosition(virtualMouseInput.virtualMouse.position.value);
    }

    private void LateUpdate()
    {
        virtualMousePosition = virtualMouseInput.virtualMouse.position.value;
        virtualMousePosition.x = Mathf.Clamp(virtualMousePosition.x, 0, 640);
        virtualMousePosition.y = Mathf.Clamp(virtualMousePosition.y, 0, 360);
        InputState.Change(virtualMouseInput.virtualMouse.position, virtualMousePosition);

    }
}
