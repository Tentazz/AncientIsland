using UnityEngine;
using UnityEngine.InputSystem;

public class HideMouseCursor : MonoBehaviour
{
    void Start()
    {
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
    }

    private void Update() {
        //InputSystem.Update();
    }
}
