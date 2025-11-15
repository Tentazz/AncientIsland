using UnityEngine;
using UnityEngine.InputSystem;

public class FakeCursor : MonoBehaviour
{
    public Vector2 fakeCursorPosition = new Vector2(0,0);
    //public Vector2 resolution = (640, 360);
    public Mouse mouse = Mouse.current;

    public Texture2D cursorTexture;
    public CursorMode cursorMode = CursorMode.Auto;
    public Vector2 hotSpot = Vector2.zero;


    void Start()
    {
        Cursor.SetCursor(cursorTexture, hotSpot, CursorMode.ForceSoftware);
        //Cursor.lockState = CursorLockMode.Locked;
    }

    private void fixedUpdate () {
        Mouse.current.WarpCursorPosition(fakeCursorPosition);
    }

    private void Update() {
        Mouse.current.WarpCursorPosition(fakeCursorPosition);
    }
    void FixedUpdate()
    {
        this.transform.position = fakeCursorPosition;
        Mouse.current.WarpCursorPosition(fakeCursorPosition);
    }
}
