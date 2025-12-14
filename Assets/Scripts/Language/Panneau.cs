using TMPro;
using UnityEngine;

public class Panneau : MonoBehaviour
{
    public string PanneauText;
    public string PanneauCustomKeys;
    public GameObject ReadingUI;
    [SerializeField] TextMeshProUGUI textPhysical;
    [SerializeField] TextMeshProUGUI textUI;


    [SerializeField] private WordScriptableObject[] WordScriptableObjects;
    

    void Start()
    {
        UpdateText();
    }


    public void Interact() {
        ReadingUI.SetActive(true);
        textUI.text = PanneauCustomKeys;
        Debug.Log("Interacting with Panneau");
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

        PanneauCustomKeys = string.Join("", keys);


        textPhysical.text = PanneauCustomKeys;// Met à jour le texte physique avec les CustomFontAssociatedKey
    }


}
