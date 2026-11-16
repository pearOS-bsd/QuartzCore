/* The input keys of the glass filters of macOS 26.7.2: the name, the atom (CAInternAtom id, the number the render server uses) and the default the renderer applies when the key is absent.
   Read from the real QuartzCore (keys with +[CAFilter inputKeys], atoms with CAInternAtom, defaults from CA::OGL::GlassBackgroundFilter::render / GlassForegroundFilter::render); see github.com/pearOS-bsd/Solarium docs/APPLE-DECISIONS.md.
   Keys with default NAN have none in the renderer (they are set by the view, or are strings/colours/vectors). Generated data, do not edit by hand. */
#define CA_GLASS_BACKGROUND_KEYS(X) \
	X(@"inputSourceSublayerName", 0x1af, NAN) \
	X(@"inputInnerRefractionAmount", 0x182, -150.0f) \
	X(@"inputInnerRefractionHeight", 0x183, 60.0f) \
	X(@"inputOuterRefractionAmount", 0x18b, 100.0f) \
	X(@"inputOuterRefractionHeight", 0x18c, 50.0f) \
	X(@"inputRefractionDistance0", 0x195, -11.0f) \
	X(@"inputRefractionDistance1", 0x196, -3.0f) \
	X(@"inputRefractionOpacity", 0x199, 0.75f) \
	X(@"inputBlurRadius", 0x164, 30.0f) \
	X(@"inputBlurOpacity0", 0x15f, 1.0f) \
	X(@"inputBlurOpacity1", 0x160, 0.1f) \
	X(@"inputBlurOpacity2", 0x161, 0.1f) \
	X(@"inputBlurOpacity3", 0x162, 0.4f) \
	X(@"inputBlurOpacity4", 0x163, NAN) \
	X(@"inputBlurDistance0", 0x15a, -450.0f) \
	X(@"inputBlurDistance1", 0x15b, -3.0f) \
	X(@"inputBlurDistance2", 0x15c, 0.0f) \
	X(@"inputBlurDistance3", 0x15d, 0.0f) \
	X(@"inputBlurDistance4", 0x15e, NAN) \
	X(@"inputFaceOpacity", 0x17a, 1.0f) \
	X(@"inputFaceColorMatrixWhite", 0x179, 1.0f) \
	X(@"inputFaceColorMatrixBlack", 0x176, 0.0f) \
	X(@"inputFaceColorMatrixSaturation", 0x178, 1.0f) \
	X(@"inputFaceColorMatrixFillColor", 0x177, NAN) \
	X(@"inputBleedAmount", 0x14d, 400.0f) \
	X(@"inputBleedHeight", 0x156, 500.0f) \
	X(@"inputBleedBlurRadius", 0x14e, 100.0f) \
	X(@"inputBleedDistance0", 0x154, -400.0f) \
	X(@"inputBleedDistance1", 0x155, -42.0f) \
	X(@"inputBleedOpacity", 0x157, 0.2f) \
	X(@"inputBleedDarkenBlend", 0x153, 0.0f) \
	X(@"inputBleedColorMatrixWhite", 0x152, 1.0f) \
	X(@"inputBleedColorMatrixBlack", 0x14f, 0.0f) \
	X(@"inputBleedColorMatrixSaturation", 0x151, 1.0f) \
	X(@"inputBleedColorMatrixFillColor", 0x150, NAN) \
	X(@"inputShadowOffset", 0x1ab, NAN) \
	X(@"inputShadowAmount", 0x1a1, 200.0f) \
	X(@"inputShadowHeight", 0x1aa, 250.0f) \
	X(@"inputShadowOpacity", 0x1ac, 1.0f) \
	X(@"inputShadowColorMatrixWhite", 0x1a8, 1.0f) \
	X(@"inputShadowColorMatrixBlack", 0x1a5, 0.0f) \
	X(@"inputShadowColorMatrixSaturation", 0x1a7, 1.0f) \
	X(@"inputShadowColorMatrixFillColor", 0x1a6, NAN) \
	X(@"inputShadowDistanceOffset", 0x1a9, -50.0f) \
	X(@"inputShadowBlurRadius", 0x1a2, 25.0f) \
	X(@"inputShadowRadius", 0x1ad, 25.0f) \
	X(@"inputSDRHoldingToneEnabled", 0x19d, 0.0f) \
	X(@"inputSDRHoldingToneWhite", 0x19e, 0.97f) \
	X(@"inputSDRGradientDistance0", 0x19b, -2.5f) \
	X(@"inputSDRGradientDistance1", 0x19c, -1.5f) \
	X(@"inputSDRShadowOpacity", 0x19f, 0.0f) \
	X(@"inputMaxHeadroom", 0x187, 1.2f) \
	X(@"inputShadowVibrancyContribution", 0x1ae, 1.0f) \
	X(@"inputClamp", 0x166, 0.0f) \
	X(@"inputClampPreserveHue", 0x167, 0.0f)
#define CA_GLASS_FOREGROUND_KEYS(X) \
	X(@"inputSourceSublayerName", 0x1af, NAN) \
	X(@"inputRefractionAmount", 0x193, -150.0f) \
	X(@"inputRefractionHeight", 0x197, 100.0f) \
	X(@"inputRefractionOffset", 0x198, -10.0f) \
	X(@"inputRefractionAngle", 0x194, 0.0f) \
	X(@"inputAberrationAmount", 0x13c, -15.0f) \
	X(@"inputAberrationHeight", 0x13e, 20.0f) \
	X(@"inputAberrationOffset", 0x13f, 0.0f) \
	X(@"inputAberrationAngle", 0x13d, 0.0f) \
	X(@"inputEdgeStart", 0x172, -4.5f) \
	X(@"inputEdgeEnd", 0x16f, -3.0f) \
	X(@"inputEdgeOpacityStart", 0x171, 0.0f) \
	X(@"inputEdgeOpacityEnd", 0x170, 1.0f)
