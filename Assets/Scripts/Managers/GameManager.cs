using UnityEngine;

public class GameManager : MonoBehaviour
{
    public int screenResolutionX;
    public int screenResolutionY;
    void Start()
    {
        // Switch to 640 x 480 full-screen
        Screen.SetResolution(screenResolutionX, screenResolutionY, true);
    }

    void Update()
    {
        
    }
}
