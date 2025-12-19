using TMPro;
using UnityEngine;

public class Panneau : MonoBehaviour
{
    public string PanneauText;
    public string PanneauCustomKeys;
    public GameObject readingUI;
    public bool verticalText = false;
    [SerializeField] TextMeshProUGUI textPhysical;
    [SerializeField] TextMeshProUGUI textUI;


    [SerializeField] private WordScriptableObject[] WordScriptableObjects;
    public GameObject[] wordUIObjects; // Assurez-vous que la taille de ce tableau correspond au nombre de WordScriptableObjects


    void Start()
    {
        UpdateText();
    }


    public void Interact() { //Activer la UI du panneau et afficher les mots
        readingUI.SetActive(true);

        Debug.Log("Interacting with Panneau");

        for (int i = 0; i < WordScriptableObjects.Length; i++) {
            //var uiWord = WordScriptableObjects[i];
            if (WordScriptableObjects[i] != null) {
                wordUIObjects[i].SetActive(true);
                wordUIObjects[i].GetComponent<UI_Word>().SetWord(WordScriptableObjects[i]);
            }

        }

    }

    public void onUse() { 
    }

    public void UpdateText() {
        // Crée un tableau de tous les mots
        string[] words = new string[WordScriptableObjects.Length];// Crée un tableau de tous les mots
        for (int i = 0; i < WordScriptableObjects.Length; i++) {// Itère à travers chaque WordScriptableObject
            words[i] = WordScriptableObjects[i].word;// Récupère le mot et le stocke dans le tableau
        }
        // Concatène tous les mots avec un espace entre eux
        PanneauText = string.Join(" ", words);

        // Même principe pour les CustomFontAssociatedKey
        string[] keys = new string[WordScriptableObjects.Length];
        for (int i = 0; i < WordScriptableObjects.Length; i++) {
            keys[i] = WordScriptableObjects[i].CustomFontAssociatedKey;
        }

        if (verticalText) {
            PanneauCustomKeys = string.Join("\n", keys);
        }
        else PanneauCustomKeys = string.Join("", keys);


        textPhysical.text = PanneauCustomKeys;// Met à jour le texte physique avec les CustomFontAssociatedKey
    }


}
