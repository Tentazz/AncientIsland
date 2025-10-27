using System;
using System.Threading;
using TMPro;
using UnityEngine;

public class TimeDebugUI : MonoBehaviour
{
    public TMP_Text debugTimeText;
    private float timeHour;
    private float timeMinute;


    // Update is called once per frame
    void Update()
    {
        timeHour = Mathf.FloorToInt(GlobalVariables.globalNormalizedTime * 24f);
        timeMinute = Mathf.FloorToInt((GlobalVariables.globalNormalizedTime * 24f - timeHour) * 60f);
        //globalNormalizedTime
        if (timeMinute < 10)
        {
            debugTimeText.text = timeHour.ToString() + ":0" + timeMinute.ToString();
            return;
        }

        debugTimeText.text = timeHour.ToString() + ":" + timeMinute.ToString();
    }
}
