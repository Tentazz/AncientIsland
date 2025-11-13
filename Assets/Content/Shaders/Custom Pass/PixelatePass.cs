using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;

class PixelatePass : CustomPass {
    public Material pixelateMaterial;

    protected override void Execute(CustomPassContext ctx) {
        if (pixelateMaterial == null)
            return;

        var cmd = ctx.cmd;
        var cameraColor = ctx.cameraColorBuffer;

        // Draw a full-screen quad using our pixelation material
        CoreUtils.DrawFullScreen(cmd, pixelateMaterial, cameraColor);
    }
}
