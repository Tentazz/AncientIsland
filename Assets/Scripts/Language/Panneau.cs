using TMPro;
using UnityEngine;

public class Panneau : MonoBehaviour
{
    public string PanneauText;
    public string PanneauGuess;
    public string PanneauCustomKeys;
    public GameObject readingUI;
    public bool verticalText = false;
    [SerializeField] TextMeshProUGUI textPhysical;


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
        string[] guess = new string[WordScriptableObjects.Length];// Crée un tableau de tous les guess
        //WordData[] wordDatas = new WordData[WordScriptableObjects.Length];

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

    void AutoFindReferences() { // Les objets doivent êtres allumés pour que ça marche !!

        readingUI = GameObject.Find("PR_UI_Reading"); // Trouve la UI de lecture dans la scène

        for (int i = 0; i < wordUIObjects.Length; i++) { // Trouve chaque UI_Word dans la scène
            wordUIObjects[i] = GameObject.Find("PR_UI_Word " + (i + 1));
        }

    }

}

