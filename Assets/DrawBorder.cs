using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DrawBorder : MonoBehaviour {

	public RectTransform rect;
	public Vector3[] LastDimen;
	public GameObject WhitePic;

	// Use this for initialization
	void Start () {
		rect = this.GetComponent<RectTransform> ();
		LastDimen = new Vector3[4];
		rect.GetWorldCorners (LastDimen);
	}
	
	// Update is called once per frame
	void Update () {
		rect.GetWorldCorners (LastDimen);
	}
}