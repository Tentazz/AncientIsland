using UnityEngine;
using UnityEngine.InputSystem;

public class HideMouseCursor : MonoBehaviour
{
    public Vector2 fakeCursorPosition = new Vector2(640/2, 360/2);

    void Start()
    {
        Cursor.visible = false;
        //Cursor.lockState = CursorLockMode.Locked;
        Cursor.lockState = CursorLockMode.Confined;
    }


    void Update()
    {
        //Mouse.current.WarpCursorPosition(fakeCursorPosition);
    }
}
