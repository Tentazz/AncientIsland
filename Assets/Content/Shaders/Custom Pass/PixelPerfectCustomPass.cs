using UnityEngine;
using UnityEngine.Experimental.Rendering;
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;

class PixelPerfectCustomPass : CustomPass {
    public int targetWidth = 640;
    public int targetHeight = 360;

    // You’ll use RTHandles for HDRP
    private RTHandle lowResRT;

    protected override void Setup(ScriptableRenderContext renderContext, CommandBuffer cmd) {
        // Create a temporary RTHandle with point filtering
        lowResRT = RTHandles.Alloc(
            targetWidth, targetHeight,
            colorFormat: GraphicsFormat.R8G8B8A8_UNorm,
            name: "LowResRT",
            filterMode: FilterMode.Point // important: point filtering
        );
    }

    protected override void Execute(CustomPassContext ctx) {
        // Copy from camera color buffer to our low res RT
        CustomPassUtils.Copy(ctx, ctx.cameraColorBuffer, lowResRT);

        // Then copy back from low‑res RT to camera color buffer
        CustomPassUtils.Copy(ctx, lowResRT, ctx.cameraColorBuffer);
    }

    protected override void Cleanup() {
        if (lowResRT != null) {
            RTHandles.Release(lowResRT);
            lowResRT = null;
        }
    }
}
