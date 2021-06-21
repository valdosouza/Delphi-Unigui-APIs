{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2015 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit FMX.Consts;

interface

{$SCOPEDENUMS ON}
uses
  System.Math.Vectors;

const
  StyleDescriptionName = 'Description';        // do not localize
  SMainItemStyle = 'menubaritemstyle';         // do not localize
  SSeparatorStyle = 'menuseparatorstyle';      // do not localize

  SMenuBarDisplayName = 'Menu Bar';            // do not localize
  SMenuAppDisplayName = 'Menu Application';    // do not localize

  SBMPImageExtension = '.bmp';                 // do not localize
  SJPGImageExtension = '.jpg';                 // do not localize
  SJPEGImageExtension = '.jpeg';               // do not localize
  SJP2ImageExtension = '.jp2';
  SPNGImageExtension = '.png';                 // do not localize
  SGIFImageExtension = '.gif';                 // do not localize
  STIFImageExtension = '.tif';                 // do not localize
  STIFFImageExtension = '.tiff';               // do not localize
  SICOImageExtension = '.ico';                 // do not localize
  SHDPImageExtension = '.hdp';                 // do not localize
  SWMPImageExtension = '.wmp';                 // do not localize
  STGAImageExtension = '.tga';                 // do not localize
  SICNSImageExtension = '.icns';               // do not localize

  // Keys for TPlatformServices.GlobalFlags
  GlobalDisableStylusGestures: string = 'GlobalDisableStylusGestures'; // do not localize
  EnableGlassFPSWorkaround: string = 'EnableGlassFPSWorkaround'; // do not localize

  FormUseDefaultPosition: Integer = -1; // same as CW_USEDEFAULT = DWORD($80000000)

type
  TEpsilonHelper = record helper for TEpsilon
  const
    Scale = 1E-4;
    FontSize = 1E-2;
    Position = 1E-3;
    Angle = 1E-4;
  end;

resourcestring

  { Error Strings }
  SInvalidPrinterOp       = 'Operation not supported on selected printer';
  SInvalidPrinter         = 'Printer selected is not valid';
  SPrinterIndexError      = 'Printer index out of range';
  SDeviceOnPort           = '%s on %s';
  SNoDefaultPrinter       = 'There is no default printer currently selected';
  SNotPrinting            = 'Printer is not currently printing';
  SPrinting               = 'Printing in progress';
  SInvalidPrinterSettings = 'Invalid printing job settings';
  SInvalidPageFormat      = 'Invalid page format settings';
  SCantStartPrintJob      = 'Cannot start the printing job';
  SCantEndPrintJob        = 'Cannot end the printing job';
  SCantPrintNewPage       = 'Cannot add the page for printing';
  SCantSetNumCopies       = 'Cannot change the number of document copies';
  StrCannotFocus          = 'Cannot focus this control';
  SResultCanNotBeNil      = 'The function ''%s'' must not return nil value';

  SInvalidStyleForPlatform = 'The style you have chosen is not available for your currently selected target platform. You can select a custom style or remove the stylebook to allow FireMonkey to automatically load the native style at run time';
  SCannotLoadStyleFromStream = 'Can''t load style from stream';
  SCannotLoadStyleFromRes = 'Can''t load style from resource';
  SCannotLoadStyleFromFile = 'Can''t load style from file %s';

  SInvalidPrinterClass    = 'Invalid printer class: %s';
  SPromptArrayTooShort    = 'Length of value array must be >= length of prompt array';
  SPromptArrayEmpty       = 'Prompt array must not be empty';
  SUnsupportedInputQuery  = 'Unsupported InputQuery fields';
  SInvalidColorString     = 'Invalid Color string';

  SInvalidFmxHandle   = 'Invalid FMX Handle: %s%.*x';
  SDelayRelease = 'At the moment you can''t change the window''s handle';
  SMediaFileNotSupported  = 'Unsupported media file %s%';
  SUnsupportedPlatformService = 'Unsupported platform service: %s';
  SServiceAlreadyRegistered = 'Service %s already registered';
  SUnsupportedOSVersion = 'Unsupported OS version: %s';
  SUnsupportedMultiInstance = 'There is an instance of "%s" already. Multiple instances are not supported';
  SNotInstance = 'Instance of "%s" not created';
  SFlasherNotRegistered = 'Class of flashing control, is not registered';
  SUnsupportedInterface = 'Class %0:s does not support interface %1:s';
  SNullException = 'Handled null exception';
  SCannotGetDeviceIDForTestAds = 'Unable to obtain device ID. Use SetTestModeDeviceID.';

  SErrorShortCut = 'An unknown combination of keys %s';
  SEUseHeirs = 'You can use only the inheritors of class "%s"';

  SUnavailableMenuId = 'Cannot create menu ID. All IDs have already been assigned';

  SInvalidGestureID = 'Invalid gesture ID (%d)';
  SInvalidStreamFormat = 'Invalid stream format';
  SDuplicateGestureName = 'Duplicate gesture name: %s';
  SDuplicateRecordedGestureName = 'A recorded gesture named %s already exists';
  SControlNotFound = 'Control not found';
  SRegisteredGestureNotFound = 'The following registered gestures were not found:' + sLinebreak + sLinebreak + '%s';
  SErrorLoadingFile = 'Error loading previously saved settings file: %s' + sLinebreak + 'Would you like to delete it?';
  STooManyRegisteredGestures = 'Too many registered gestures';
  SDuplicateRegisteredGestureName = 'A registered gesture named %s already exists';
  SUnableToSaveSettings = 'Unable to save settings';
  SInvalidGestureName = 'Invalid gesture name (%s)';
  SOutOfRange = 'Value must be between %d and %d';

  SAddIStylusAsyncPluginError = 'Unable to add IStylusAsyncPlugin: %s';
  SAddIStylusSyncPluginError = 'Unable to add IStylusSyncPlugin: %s';
  SRemoveIStylusAsyncPluginError = 'Unable to remove IStylusAsyncPlugin: %s';
  SRemoveIStylusSyncPluginError = 'Unable to remove IStylusSyncPlugin: %s';
  SStylusHandleError = 'Unable to get or set window handle: %s';
  SStylusEnableError = 'Unable to enable or disable IRealTimeStylus: %s';
  SEnableRecognizerError = 'Unable to enable or disable IGestureRecognizer: %s';
  SInitialGesturePointError = 'Unable to retrieve initial gesture point';
  SSetStylusGestureError = 'Unable to set stylus gestures: %s';
  StrESingleMainMenu = 'The main menu can be only a single instance';
  SMainMenuSupportsOnlyTMenuItems = 'A main menu only supports TMenuItem children';

  SNoImplementation = 'No %s implementation found';
  SNotImplementedOnPlatform = '%s not implemented on this platform';
  {$IFDEF ANDROID}
  SInputQueryAndroidOverloads = 'On Android platform, only overloads with TInputCloseBoxProc or TInputCloseBoxEvent ' +
    'are supported';
  {$ENDIF}

  SBitmapSizeNotEqual = 'Bitmap size must be equal in copy operation';

  SBlockingDialogs = 'Blocking dialogs';

  SCannotCreateScrollContent = 'Cannot create %s, because |CreateScrollContent| must return not nil object';
  SContentCannotBeNil = 'Presentation received nil Content from TPresentedControl. Content cannot be nil.';

  SPointInTextLayoutError = 'Point not in layout';
  SCaretLineIncorrect = 'TCaretPosition.Line has incorrect value';
  SCaretPosIncorrect = 'TCaretPosition.Pos has incorrect value';

  SInvalidSceneUpdatingPairCall = 'Invalid IScene.DisableUpdating/IScene.EnableUpdating call pair';

  SNoPlatformStyle = 'No platform styles found'; // happens when there are no platform styles at all
  SInvalidPlatformStyle = 'No platform style found for the current platform'; // happens when there are platform styles, just not the right ones
  SNoIDeviceBehaviorBehavior = 'Required IDeviceBehavior is not registered';
  SStyleResourceDoesNotExist = 'Style resource does not exist';

  { Dialog Strings }
  SMsgDlgWarning = 'Warning';
  SMsgDlgError = 'Error';
  SMsgDlgInformation = 'Information';
  SMsgDlgConfirm = 'Confirm';
  SMsgDlgYes = 'Sim';
  SMsgDlgNo = 'Não';
  SMsgDlgOK = 'OK';
  SMsgDlgCancel = 'Cancel';
  SMsgDlgHelp = 'Help';
  SMsgDlgHelpNone = 'No help available';
  SMsgDlgHelpHelp = 'Help';
  SMsgDlgAbort = 'Abort';
  SMsgDlgRetry = 'Retry';
  SMsgDlgIgnore = 'Ignore';
  SMsgDlgAll = 'All';
  SMsgDlgNoToAll = 'Não para Todos';
  SMsgDlgYesToAll = 'Sim para Todos';
  SMsgDlgClose = 'Close';

  SWindowsVistaRequired = '%s requires Windows Vista or later';

  SUsername = '&Username';
  SPassword = '&Password';
  SDomain = '&Domain';
  SLogin = 'Login';

  { Menus }
  SMenuAppQuit = 'Quit %s';
  SMenuCloseWindow = 'Close Window';
  SMenuAppHide = 'Hide %s';
  SMenuAppHideOthers = 'Hide Others';
  SAppDesign = '<Application.Title>';
  SAppDefault = 'application';
  SGotoTab = 'Go to %s';
  SGotoNilTab = 'Go to <Tab>';
  SMediaPlayerStart = 'Play';
  SMediaPlayerPause = 'Pause';
  SMediaPlayerStop = 'Stop';
  SMediaPlayerVolume = '%3.0F %%';
  
  SMsgGooglePlayServicesNeedUpdating = 'Google Play Services needs to be updated. Please go to Play Store to update '
    + ' Google Play Services then, restart the application';
const
{$IFDEF MACOS}
  SmkcBkSp = Chr($232B); // (NSBackspaceCharacter);
  SmkcTab = Chr($21E5); // (NSTabCharacter);
  SmkcEsc = Chr($238B);
  SmkcEnter = Chr($21A9); // (NSCarriageReturnCharacter);
  SmkcPgUp = Chr($21DE); // (NSPageUpFunctionKey);
  SmkcPgDn = Chr($21DF); // (NSPageDownFunctionKey);
  SmkcEnd = Chr($2198); // (NSEndFunctionKey);
  SmkcDel = Chr($2326); // (NSDeleteCharacter);
  SmkcHome = Chr($2196); // (NSHomeFunctionKey);
  SmkcLeft = Chr($2190); // (NSLeftArrowFunctionKey);
  SmkcUp = Chr($2191); // (NSUpArrowFunctionKey);
  SmkcRight = Chr($2192); // (NSRightArrowFunctionKey);
  SmkcDown = Chr($2193); // (NSDownArrowFunctionKey);
  SmkcNumLock = Chr($2327);
  SmkcPara = Chr($00A7);
  SmkcShift = Chr($21E7);
  SmkcCtrl = Chr($2303);
  SmkcAlt = Chr($2325);
  SmkcCmd = Chr($2318);
  // Specific keys for OSX
  SmkcBacktab= Chr($21E4);
  SmkcIbLeft= Chr($21E0);
  SmkcIbUp= Chr($21E1);
  SmkcIbRight= Chr($21E2);
  SmkcIbDown= Chr($21E3);
  SmkcIbEnter= Chr($2305);
  SmkcIbHelp= Chr($225F);
{$ELSE}
  SmkcBkSp = 'BkSp';
  SmkcTab = 'Tab';
  SmkcEsc = 'Esc';
  SmkcEnter = 'Enter';
  SmkcPgUp = 'PgUp';
  SmkcPgDn = 'PgDn';
  SmkcEnd = 'End';
  SmkcDel = 'Del';
  SmkcHome = 'Home';
  SmkcLeft = 'Left';
  SmkcUp = 'Up';
  SmkcRight = 'Right';
  SmkcDown = 'Down';
  SmkcNumLock = 'Num Lock';
  SmkcPara = 'Paragraph';
  SmkcShift = 'Shift+';
  SmkcCtrl = 'Ctrl+';
  SmkcAlt = 'Alt+';
  SmkcCmd = 'Cmd+';

  SmkcLWin = 'Left Win';
  SmkcRWin = 'Right Win';
  SmkcApps = 'Application';
  SmkcClear = 'Clear';
  SmkcScroll = 'Scroll Lock';
  SmkcCancel = 'Break';
  SmkcLShift = 'Left Shift';
  SmkcRShift = 'Right Shift';
  SmkcLControl = 'Left Ctrl';
  SmkcRControl = 'Right Ctrl';
  SmkcLMenu = 'Left Alt';
  SmkcRMenu = 'Right Alt';
  SmkcCapital = 'Caps Lock';
{$ENDIF}
  SmkcOem102 = 'Oem \';
  SmkcSpace = 'Space';
  SmkcNext = 'Next';
  SmkcBack = 'Back';
  SmkcIns = 'Ins';
  SmkcPause = 'Pause';
  SmkcCamera = 'Camera';
  SmkcBrowserBack= 'BrowserBack';
  SmkcHardwareBack= 'HardwareBack';
  SmkcNum = 'Num %s';

resourcestring
  SEditUndo = 'Undo';
  SEditCopy = 'Copy';
  SEditCut = 'Cut';
  SEditPaste = 'Paste';
  SEditDelete = 'Delete';
  SEditSelectAll = 'Select All';

  SAseLexerTokenError = 'ERROR at line %d. %s expected but token %s found.';
  SAseLexerCharError = 'ERROR at line %d. ''%s'' expected but char ''%s'' found.';
  SAseLexerFileCorruption = 'File is corrupt.';

  SAseParserWrongMaterialsNumError = 'Wrong materials number';
  SAseParserWrongVertexNumError = 'Wrong vertex number';
  SAseParserWrongNormalNumError = 'Wrong normal number';
  SAseParserWrongTexCoordNumError = 'Wrong texture coord number';
  SAseParserWrongVertexIdxError = 'Wrong vertex index';
  SAseParserWrongFacesNumError = 'Wrong faces number';
  SAseParserWrongFacesIdxError = 'Wrong faces index';
  SAseParserWrongTriangleMeshNumError = 'Wrong triangle mesh number';
  SAseParserWrongTriangleMeshIdxError = 'Wrong triangle mesh index';
  SAseParserWrongTexCoordIdxError = 'Wrong texture coord index';
  SAseParserUnexpectedKyWordError = 'Unexpected key word';

  SIndexDataNotFoundError = 'Index data not found. File is corrupt.';
  SEffectIdNotFoundError = 'Effect id %s not found. File is corrupt.';
  SMeshIdNotFoundError = 'Mesh id %s not found. File is corrupt.';
  SControllerIdNotFoundError = 'Controller id %s not found. File is corrupt.';

  SCannotCreateCircularDependence = 'Cannot create a circular dependency between components';
  SPropertyOutOfRange = '%s property out of range';

  SPrinterDPIChangeError = 'Active printer DPI can''t be changed while printing';
  SPrinterSettingsReadError = 'Error occured while reading printer settings: %s';
  SPrinterSettingsWriteError = 'Error occured while writing printer settings: %s';

  SVAllFiles = 'All Files';
  SVBitmaps = 'Bitmaps';
  SVIcons = 'Icons';
  SVTIFFImages = 'TIFF Images'; 
  SVJPGImages = 'JPEG Images';
  SVPNGImages = 'PNG Images';
  SVGIFImages = 'GIF Images';
  SVJP2Images = 'Jpeg 2000 Images';
  SVTGAImages = 'TGA Images';
  SWMPImages = 'WMP Images';

  SVAviFiles = 'AVI Files';
  SVWMVFiles = 'WMV Files';
  SVMP4Files = 'Mpeg4 Files';
  SVMOVFiles = 'QuickTime Files';
  SVM4VFiles = 'M4V Files';

  SVWMAFiles = 'Windows Media Audio Files';
  SVMP3Files = 'Mpeg Layer 3 Files';
  SVWAVFiles = 'WAV Files';
  SVCAFFiles = 'Apple Core Audio Format Files';
  SV3GPFiles = '3GP Audio Files';
  SVM4AFiles = 'M4A Files';

  StrEChangeFixed  = 'The "%s" cannot be modified (Fixed = True)';
  StrEDupScale     = 'Duplicate scale value %s';
  StrOther         = 'Other scale';
  StrScale1        = 'Normal';
  StrScale2        = 'Hi Res';

  { Media }

  SNoFlashError = 'Flash doesn''t exist on this device';
  SNoTorchError = 'Flash doesn''t exist on this device';

  { Pickers }
  SPickerCancel = 'Cancel';
  SPickerDone   = 'Done';
  SEditorDone   = 'Done';
  SListPickerIsNotFound = 'This version of Android does not have an implementation of list pickers';
  SDateTimePickerIsNotFound = 'This version of Android does not have an implementation of Date/Time pickers';

  { Notification Center }
  SNotificationCancel = 'Cancel';
  SNotificationCenterTitleIsNotSupported = 'NotificationCenter: Title is not supported in iOS';
  SNotificationCenterActionIsNotSupported = 'NotificationCenter: Action is not supported in Android';

  { Media Library }
  STakePhotoFromCamera = 'Take Photo';
  STakePhotoFromLibarary = 'Photo Library';
  SOpenStandartServices = 'Open to';
  SSavedPhotoAlbum = 'Saved Photos';
  SImageSaved = 'Image saved';

  { Canvas helpers / 2D and 3D engine / GPU }
  SBitmapIncorrectSize = 'Incorrect size of bitmap parameter(s).';
  SBitmapLoadingFailed = 'Loading bitmap failed.';
  SBitmapLoadingFailedNamed = 'Loading bitmap failed (%s).';
  SBitmapSizeTooBig = 'Bitmap size too big.';
  SInvalidCanvasParameter = 'Invalid call of GetParameter.';
  SThumbnailLoadingFailed = 'Loading thumbnail failed.';
  SThumbnailLoadingFailedNamed = 'Loading thumbnail failed (%s).';
  SBitmapSavingFailed = 'Saving bitmap failed.';
  SBitmapSavingFailedNamed = 'Saving bitmap failed (%s).';
  SBitmapFormatUnsupported = 'The specified bitmap format is not supported.';
  SRetrieveSurfaceDescription = 'Could not retrieve surface description.';
  SRetrieveSurfaceContents = 'Could not retrieve surface contents.';
  SAcquireBitmapAccess = 'Failed acquiring access to bitmap.';
  SVideoCaptureFault = 'Failure during video feed capture.';
  SNoCaptureDeviceManager = 'No CaptureDeviceManager implementation found';
  SInvalidCallingConditions = 'Invalid calling conditions for ''%s''.';
  SInvalidRenderingConditions = 'Invalid rendering conditions for ''%s''.';
  STextureSizeTooSmall = 'Cannot create texture for ''%s'' because the size is too small.';
  SCannotAcquireBitmapAccess = 'Cannot acquire bitmap access for ''%s''.';
  SCannotFindSuitablePixelFormat = 'Cannot find a suitable pixel format for ''%s''.';
  SCannotFindSuitableShader = 'Cannot find a suitable shader for ''%s''.';
  SCannotDetermineDirect3DLevel = 'Cannot determine Direct3D support level.';
  SCannotCreateDirect3D = 'Cannot create Direct3D object for ''%s''.';
  SCannotCreateD2DFactory = 'Cannot create Direct2D Factory object for ''%s''.';
  SCannotCreateDWriteFactory = 'Cannot create DirectWrite Factory object for ''%s''.';
  SCannotCreateWICImagingFactory = 'Cannot create WIC Imaging Factory object for ''%s''.';
  SCannotCreateRenderTarget = 'Cannot create rendering target for ''%s''.';
  SCannotCreateD3DDevice = 'Cannot create Direct3D device for ''%s''.';
  SCannotAcquireDXGIFactory = 'Cannot acquire DXGI factory from Direct3D device for ''%s''.';
  SCannotResizeBuffers = 'Cannot resize buffers for ''%s''.';
  SCannotAssociateWindowHandle = 'Cannot associate the window handle for ''%s''.';
  SCannotRetrieveDisplayMode = 'Cannot retrieve display mode for ''%s''.';
  SCannotRetrieveBufferDesc = 'Cannot retrieve buffer description for ''%s''.';
  SCannotCreateSamplerState = 'Cannot create sampler state for ''%s''.';
  SCannotRetrieveSurface = 'Cannot retreive surface for ''%s''.';
  SCannotCreateTexture = 'Cannot create texture for ''%s''.';
  SCannotUploadTexture = 'Cannot upload pixel data to texture for ''%s''.';
  SCannotActivateTexture = 'Cannot activate the texture for ''%s''.';
  SCannotAcquireTextureAccess = 'Cannot acquire texture access for ''%s''.';
  SCannotCopyTextureResource = 'Cannot copy texture resource ''%s''.';
  SCannotCreateRenderTargetView = 'Cannot create render target view for ''%s''.';
  SCannotActivateFrameBuffers = 'Cannot activate frame buffers for ''%s''.';
  SCannotCreateRenderBuffers = 'Cannot create render buffers for ''%s''.';
  SCannotRetrieveRenderBuffers = 'Cannot retrieve device render buffers for ''%s''.';
  SCannotActivateRenderBuffers = 'Cannot activate render buffers for ''%s''.';
  SCannotBeginRenderingScene = 'Cannot begin rendering scene for ''%s''.';
  SCannotSyncDeviceBuffers = 'Cannot synchronize device buffers for ''%s''.';
  SCannotUploadDeviceBuffers = 'Cannot upload device buffers for ''%s''.';
  SCannotCreateDepthStencil = 'Cannot create a depth/stencil buffer for ''%s''.';
  SCannotRetrieveDepthStencil = 'Cannot retrieve device depth/stencil buffer for ''%s''.';
  SCannotActivateDepthStencil = 'Cannot activate depth/stencil buffer for ''%s''.';
  SCannotCreateSwapChain = 'Cannot create a swap chain for ''%s''.';
  SCannotResizeSwapChain = 'Cannot resize swap chain for ''%s''.';
  SCannotActivateSwapChain = 'Cannot activate swap chain for ''%s''.';
  SCannotCreateVertexShader = 'Cannot create vertex shader for ''%s''.';
  SCannotCreatePixelShader = 'Cannot create pixel shader for ''%s''.';
  SCannotCreateVertexLayout = 'Cannot create vertex layout for ''%s''.';
  SCannotCreateVertexDeclaration = 'Cannot create vertex declaration for ''%s''.';
  SCannotCreateVertexBuffer = 'Cannot create vertex buffer for ''%s''.';
  SCannotCreateIndexBuffer = 'Cannot create index buffer for ''%s''.';
  SCannotCreateShader = 'Cannot create shader for ''%s''.';
  SCannotFindShaderVariable = 'Cannot find shader variable ''%s''.';
  SCannotActivateShaderProgram = 'Cannot activate shader program for ''%s''.';
  SCannotCreateOpenGLContext = 'Cannot create OpenGL context for ''%s''.';
  SCannotUpdateOpenGLContext = 'Cannot update OpenGL context for ''%s''.';
  SCannotDrawMeshObject = 'Cannot draw mesh object for ''%s''.';
  SErrorInContextMethod = 'Error in context method ''%s''.';
  SFeatureNotSupported = 'This feature is not supported in ''%s''.';
  SErrorCompressingStream = 'Error compressing stream.';
  SErrorDecompressingStream = 'Error decompressing stream.';
  SErrorUnpackingShaderCode = 'Error unpacking shader code.';

  SCannotAddFixedSize = 'Cannot add columns or rows while expand style is fixed size';
  SInvalidSpan = '''%d'' is not a valid span';
  SInvalidRowIndex = 'Row index, %d, out of bounds';
  SInvalidColumnIndex = 'Column index, %d, out of bounds';
  SInvalidControlItem = 'ControlItem.Control cannot be set to owning GridPanel';
  SCannotDeleteColumn = 'Cannot delete a column that contains controls';
  SCannotDeleteDefColumn = 'You can''t delete a column by default';
  SCannotDeleteRow = 'Cannot delete a row that contains controls';
  SCellMember = 'Member';
  SCellSizeType = 'Size Type';
  SCellValue = 'Value';
  SCellAutoSize = 'Auto';
  SCellPercentSize = 'Percent';
  SCellAbsoluteSize = 'Absolute';
  SCellColumn = 'Column%d';
  SCellRow = 'Row%d';

  SDateTimeMax = 'Date exceeds maximum of "%s"';
  SDateTimeMin = 'Date is less than minimum of "%s"';

  SDateTimePickerShowModeNotSupported = 'DateTime picker doesn''t support psmDateTime on current platform';

  SMediaLibraryOpenImageWith = 'Send image using:';
  SMediaLibraryOpenTextWith = 'Send text using:';
  SMediaLibraryOpenTextAndImageWith = 'Send text/image using:';

  SNativePresentation = 'Native %s';

  { In-App Purchase }
  SIAPNotSetup = 'In-App Purchase component is not setup';
  SIAPNoLicenseKey = 'In-App Purchase component has no license key';
  SIAPPayloadVerificationFailed = 'Transaction payload verification failed';
  SIAPAlreadyPurchased = 'Item has already been purchased';
  SIAPNotAlreadyPurchased = 'Cannot consume an item you have not purchased';
  SIAPSetupProblem = 'Problem setting up in-app billing';
  SIAPIllegalArguments = 'Argument problem in IAP API';
  SITunesConnectionError = 'Cannot connect to iTunes Store';
  SProductsRequestInProgress = 'Products request already in progress';

  { Advertising }
  SAdFailedToLoadError = 'Ad failed to load: %d';

  { TMultiView }
  SCannotCreatePresentation = 'You can not create Presentation without MultiView';
  SDrawer = 'Drawer';
  SOverlapDrawer = 'Overlap Drawer';
  SDockedPanel = 'Docked Panel';
  SPopover = 'Popover';
  SNavigationPane = 'Navigation Pane';
  SObjectCannotBeChild = '"%s" cannot be a child of "%s"';

  { Presentations }
  SWrongModelClassType = 'Model is not valid class. Expected [%s], but received [%s]';
  SWrongParameter = '[%] parameter cannot be nil';
  SControlWithoutPresentation = '[%s] without Presentation';
  SControlClassIsNil = 'AControlClass cannot be nil. Factory cannot generate presentation name.';
  SPresentationProxyCreateError = 'Cannot create presentation proxy with nil model or PresentedControl. ' +
    'Use overloaded version of constructor with parameters and pass correct values.';
  SPresentationProxyClassNotFound = 'Presentation Proxy class for presentation name [%s] is not found';
  SPresentationProxyClassIsNil = 'APresentationProxyClass is nil. Factory cannot register presentation with a nil presentation proxy class.';
  SPresentationProxyNameIsEmpty = 'APresentationName is empty. Factory cannot register presentation with an empty presentation name';
  SPresentationAlreadyRegistered = 'Presentation Proxy class [%s] for this presentation name [%s] has already been registered.';
  SPresentationTitleInDesignTime = '%s (%s)';

  { TScrollBox }
  SScrollBoxOwnerWrong = '|AOwner| should be an instance of TCustomPresentedScrollBox';
  SScrollBoxAniCalculations = 'Could not create styled presentation because CreateAniCalculations returned nil.';

  { Data Model }
  SDataModelKeyEmpty = 'Key cannot be empty. Data model cannot set or get data by key with an empty name.';

  { Analytics }
  SInvalidActivityTrackingAppID = 'Invalid Application ID';
  SAppAnalyticsDefaultPrivacyMessage = 'Privacy Notice:' + sLineBreak + sLineBreak +
    'This application anonymously tracks your usage and sends it to us for analysis. We use this analysis to make ' +
    'the software work better for you.' + sLineBreak + sLineBreak +
    'This tracking is completely anonymous. No personally identifying information is tracked, and nothing about ' +
    'your usage can be tracked back to you.' + sLineBreak + sLineBreak +
    'Please click Yes to help us to improve this software. Thank you.';
  SCustomAnalyticsCategoryMissing = 'AppAnalytics custom event error: category cannot be empty.';

implementation

end.

