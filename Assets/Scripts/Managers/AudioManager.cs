using DG.Tweening;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Audio;
using UnityEngine.Rendering;
public class AudioManager : MonoBehaviour 
{
    public AudioSource musicSource01;
    public AudioSource musicSource02;

    private AudioSource currentMusicSource;


    //private bool AudioSourceSwap;
    private AudioClip currentlyPlaying;

    public Ease AudioSwitchEase;
    public float AudioSwitchDuration = 10f;

    public int isInsideZone = 0;

    void Start() {
        currentMusicSource = musicSource01;
    }

    public void PlayMusicNext(AudioClip newMusicClip, float newMusicVolume)
    {
        isInsideZone = +1;

        if (currentMusicSource == musicSource01) 
        {
            if (musicSource01.clip == null) {
                musicSource01.clip = newMusicClip;
                musicSource01.Play();
                musicSource01.DOFade(newMusicVolume, AudioSwitchDuration).SetEase(Ease.InQuad);
                musicSource02.DOFade(0f, AudioSwitchDuration).SetEase(Ease.OutQuad);
            }

            else if (newMusicClip == musicSource01.clip) {
                musicSource01.DOFade(newMusicVolume, AudioSwitchDuration).SetEase(Ease.InQuad);
            }

            else if (newMusicClip != musicSource01.clip) {
                musicSource02.clip = newMusicClip;
                musicSource02.Play();
                musicSource02.DOFade(newMusicVolume, AudioSwitchDuration).SetEase(Ease.InQuad);
                musicSource01.DOFade(0f, AudioSwitchDuration).SetEase(Ease.OutQuad);
                currentMusicSource = musicSource02;
                //print("Switching to music source 2"); 
            }
        }

        else if (currentMusicSource == musicSource02) {
            if (musicSource02.clip == null) {
                musicSource02.clip = newMusicClip;
                musicSource02.Play();
                musicSource02.DOFade(newMusicVolume, AudioSwitchDuration).SetEase(Ease.InQuad);
                musicSource01.DOFade(0f, AudioSwitchDuration).SetEase(Ease.OutQuad);
            }

            else if (newMusicClip == musicSource02.clip) {
                musicSource02.DOFade(newMusicVolume, AudioSwitchDuration).SetEase(Ease.InQuad);
            }

            else if (newMusicClip != musicSource02.clip) {
                musicSource01.clip = newMusicClip;
                musicSource01.Play();
                musicSource01.DOFade(newMusicVolume, AudioSwitchDuration).SetEase(Ease.InQuad);
                musicSource02.DOFade(0f, AudioSwitchDuration).SetEase(Ease.OutQuad);
                currentMusicSource = musicSource01;
                //print("Switching to music source 1");
            }
        }

        currentlyPlaying = newMusicClip;
    }

    public void MusicTriggerExit() 
    {
        print("Exited music zone");
        isInsideZone = isInsideZone - 1;
        isInsideZone = Mathf.Clamp(isInsideZone, 0, 10000000);
        if (isInsideZone == 0) 
        {
            // Fade out current music
            currentMusicSource.DOFade(0f, AudioSwitchDuration).SetEase(Ease.OutQuad);
        }
    }

}

