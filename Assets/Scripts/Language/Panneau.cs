using TMPro;
using UnityEngine;

public class Panneau : MonoBehaviour
{
    public string PanneauText;
    public GameObject ReadingUI;
    [SerializeField] TextMeshProUGUI textPhysical;
    [SerializeField] TextMeshProUGUI textUI;

    void Start()
    {
        textPhysical.text = PanneauText;
    }


    public void Interact() {
        ReadingUI.SetActive(true);
        textUI.text = PanneauText;
        Debug.Log("Interacting with Panneau");
    }


}
