using UnityEngine;
using System.Collections;
using System.Collections.Generic;

interface IInteractable
{
    public void Interact();
}

public class Interactor : MonoBehaviour
{

    public Transform InteractorSource;
    public float InteractRange;
    public GameObject InteractableUI;

    private LayerMask layerMask;
    private Ray r;
    //private RaycastHit hit;

    void Start()
    {
        layerMask = LayerMask.NameToLayer("Interactable");
    }


    void Update()
    {
        RaycastHit hit;
        r = new Ray(InteractorSource.position, InteractorSource.forward);
        if (Physics.Raycast(r, out hit, InteractRange)) // Raycast to activate UI or not
            {
            //Debug.DrawRay(InteractorSource.position, InteractorSource.forward * hit.distance, Color.yellow);

            if (hit.transform.gameObject.layer == layerMask) 
                {
                //print("Layer is Interactable");
                InteractableUI.SetActive(true);
                }
            }

        else {
            InteractableUI.SetActive(false);
        }

        if (Input.GetKeyDown(KeyCode.E)) // Interact raycast
            {
            r = new Ray(InteractorSource.position, InteractorSource.forward);
            if (Physics.Raycast(r, out hit, InteractRange)) 
                {
                if (hit.collider.gameObject.TryGetComponent(out IInteractable interactObj))
                    {
                    interactObj.Interact();
                    }
                }
            }
    }

}
