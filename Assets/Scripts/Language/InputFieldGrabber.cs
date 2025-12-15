using TMPro;
using UnityEngine;
using UnityEngine.LightTransport;

public class InputFieldGrabber : MonoBehaviour
{

    [Header("The value grabbed from the input field")]
    [SerializeField] private string inputText;

    public GameObject UIWord;

    private void OnEnable() {
        this.GetComponent<TMP_InputField>().Select();
    }

    public void GrabFromInputField(string input)
    {
        inputText = input;
        UIWord.GetComponent<UI_Word>().changeGuess(inputText);
        this.gameObject.SetActive(false);
    }

}
