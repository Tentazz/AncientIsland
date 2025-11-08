using UnityEngine;
using UnityEngine.InputSystem;
using System.Collections;
using DG.Tweening;

public class InventoryManager : MonoBehaviour
{
    public InputActionAsset InputActions;
    public InputAction torchAction;
    public InputAction jumellesAction;

    public GameObject torchObject;
    public GameObject jumellesObject;
    private GameObject currentObjet;

    public Light torchLight1;
    public Light torchLight2;
    public Light torchLight3;

    public Animator cameraAnimator;

    public float rangementSpeed = 1f;

    public bool hasTorch;
    public bool hasJumelles;



    private void OnEnable() {
        InputActions.FindActionMap("Player").Enable(); //activer le systeme d'input du joueur
    }

    private void OnDisable() {
        InputActions.FindActionMap("Player").Disable();//desactiver le systeme d'input du joueur
    }

    private void Awake() {
        torchAction = InputSystem.actions.FindAction("Torch");
        jumellesAction = InputSystem.actions.FindAction("Jumelles");
    }


    void Start()
    {
        torchLight1.color = new Color(0f, 0f, 0f, 0f);
        torchLight2.color = new Color(0f, 0f, 0f, 0f);
        torchLight3.color = new Color(0f, 0f, 0f, 0f);
    }


    void Update() {

        // TORCHE
        if (hasTorch == true) 
        {
            if (torchAction.WasReleasedThisFrame() && currentObjet != torchObject) {
                StartCoroutine(switchObjet(currentObjet, torchObject));
            }

            else if (torchAction.WasReleasedThisFrame() && currentObjet == torchObject) {
                StartCoroutine(switchObjet(torchObject, null));
                
            }

        }
        // JUMELLES
        if (hasJumelles == true) 
        {
            if (jumellesAction.WasReleasedThisFrame() && currentObjet != jumellesObject) {
                StartCoroutine(switchObjet(currentObjet, jumellesObject));
            }

            else if (jumellesAction.WasReleasedThisFrame() && currentObjet == jumellesObject) {
                StartCoroutine(switchObjet(jumellesObject, null));
            }
        }

    }


    IEnumerator switchObjet(GameObject oldObject, GameObject newObject) {
        // Ranger l'ancien objet

        if (oldObject != null) {
            if (oldObject == torchObject) {
                torchLight1.DOColor(new Color(0f, 0f, 0f, 0f), 0.5f);
                torchLight2.DOColor(new Color(0f, 0f, 0f, 0f), 0.5f);
                torchLight3.DOColor(new Color(0f, 0f, 0f, 0f), 0.5f);
            }
            cameraAnimator.SetBool("ObjetSorti", false); //lancer l'animation de rangement
            yield return new WaitForSeconds(rangementSpeed); //attendre la fin de l'animation
            oldObject.SetActive(false); //desactiver l'ancien objet
            currentObjet = null; //indique qu'aucun objet n'est actuellement sorti
        }

        //Sortir le nouvel objet seulement s'il y en a un
        if (newObject != oldObject && newObject != null) {
            if (newObject == torchObject) {
                torchLight1.DOColor(new Color(1f, 1f, 1f, 1f), 0.66f);
                torchLight2.DOColor(new Color(1f, 1f, 1f, 1f), 0.66f);
                torchLight3.DOColor(new Color(1f, 1f, 1f, 1f), 0.66f);
            }
            newObject. SetActive(true); //activer le nouvel objet
            cameraAnimator.SetBool("ObjetSorti", true);//   lancer l'animation de sortie
            currentObjet = newObject; //mettre a jour l'objet actuellement sorti
        }

    }
}
