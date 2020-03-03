using UnityEngine;
using System.Collections;
using Vuforia;

public class Earth : MonoBehaviour, IVirtualButtonEventHandler{
	[Header("Settings")]
    public float Speed = 1.0f;

	public void OnButtonPressed(VirtualButtonBehaviour vb){
		Debug.Log("Pressed");
	}

	public void OnButtonReleased(VirtualButtonBehaviour vb){
		Debug.Log("Released");
	}

	void FixedUpdate () {
        this.transform.Rotate(transform.position.x, Speed, transform.position.z);
	}


}
