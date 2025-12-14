using UnityEngine;


[CreateAssetMenu(fileName = "New Word", menuName = "Language/Word")]
public class WordScriptableObject : ScriptableObject
{
    public string word;
    public string CustomFontAssociatedKey;
}
