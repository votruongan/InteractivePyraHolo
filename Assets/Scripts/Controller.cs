using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;

public class Controller : MonoBehaviour, IVirtualButtonEventHandler{
	public GameObject toSpawn;
	public VirtualButtonBehaviour virtbutt;

	public void OnButtonPressed(VirtualButtonBehaviour vb)
	{
		GameObject.Instantiate (toSpawn,vb.transform.position,vb.transform.rotation);
		Debug.Log ("!!! PRESSED !!!");
	}

	public void OnButtonReleased(VirtualButtonBehaviour vb)
	{
		Debug.Log ("!!! RELEASED !!!");		
	}

	void Start(){
		virtbutt.RegisterEventHandler (this);
	}
}
