using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;

public class InputFieldGrabber : MonoBehaviour
{

    //public InputActionAsset InputActions;


    [Header("The value grabbed from the input field")]
    [SerializeField] private string inputText;

    public GameObject UIWord;

    private void OnEnable() {
        this.GetComponent<TMP_InputField>().Select();

        //InputActions.FindActionMap("Player").Disable(); //activer le systeme d'input du joueur
    }

    private void OnDisable ()
    {
        //InputActions.FindActionMap("Player").Enable();//desactiver le systeme d'input du joueur
    }

    public void GrabFromInputField(string input)
    {
        inputText = input;
        UIWord.GetComponent<UI_Word>().changeGuess(inputText);
        this.gameObject.SetActive(false);
    }

}
