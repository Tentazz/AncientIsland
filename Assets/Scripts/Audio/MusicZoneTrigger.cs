using UnityEngine;
using UnityEngine.Audio;

public class MusicZoneTrigger : MonoBehaviour
{

    public AudioClip musicClip;
    public AudioManager audioManager;
    public float musicVolume = 1.0f;

    void Start()
    {
        musicClip.LoadAudioData();
    }

    void Update()
    {
        
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            //print("Player entered music zone: " + gameObject.name);
            audioManager.PlayMusicNext(musicClip, musicVolume);
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            audioManager.MusicTriggerExit();
            print("Player exited music zone: " + gameObject.name);
        }
    }
}
