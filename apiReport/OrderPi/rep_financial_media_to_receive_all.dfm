inherited RepFinancialMediaToRreceiveAll: TRepFinancialMediaToRreceiveAll
  Caption = 'Todos os dados'
  ClientHeight = 677
  ClientWidth = 1207
  ExplicitWidth = 1223
  ExplicitHeight = 716
  PixelsPerInch = 96
  TextHeight = 13
  inherited Qrpt: TQuickRep
    Left = 24
    Width = 1191
    Height = 1684
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      50.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    Zoom = 150
    ExplicitLeft = 24
    ExplicitWidth = 1191
    ExplicitHeight = 1684
    inherited PageHeader: TQRBand
      Left = 28
      Top = 57
      Width = 1134
      Height = 194
      Size.Values = (
        342.194444444444500000
        2000.250000000000000000)
      ExplicitLeft = 28
      ExplicitTop = 57
      ExplicitWidth = 1134
      ExplicitHeight = 194
      inherited E_Titulo: TQRLabel
        Top = 166
        Width = 1134
        Height = 26
        Size.Values = (
          45.861111111111120000
          0.000000000000000000
          292.805555555555600000
          2000.250000000000000000)
        FontSize = 10
        ExplicitTop = 166
        ExplicitWidth = 1134
        ExplicitHeight = 26
      end
      inherited Img_Logo: TQRImage
        Left = 10
        Top = 6
        Width = 225
        Height = 156
        Size.Values = (
          275.166666666666700000
          18.520833333333330000
          10.583333333333330000
          396.875000000000000000)
        ExplicitLeft = 10
        ExplicitTop = 6
        ExplicitWidth = 225
        ExplicitHeight = 156
      end
      inherited Lb_Emp_Nome: TQRLabel
        Left = 243
        Top = 3
        Width = 809
        Height = 26
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          5.291666666666667000
          1426.104166666667000000)
        FontSize = 9
        ExplicitLeft = 243
        ExplicitTop = 3
        ExplicitWidth = 809
        ExplicitHeight = 26
      end
      inherited Lb_Emp_Doc: TQRLabel
        Left = 243
        Top = 30
        Width = 809
        Height = 26
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          52.916666666666660000
          1426.104166666667000000)
        FontSize = 9
        ExplicitLeft = 243
        ExplicitTop = 30
        ExplicitWidth = 809
        ExplicitHeight = 26
      end
      inherited Lb_Emp_End: TQRLabel
        Left = 243
        Top = 58
        Width = 809
        Height = 26
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          103.187500000000000000
          1426.104166666667000000)
        FontSize = 9
        ExplicitLeft = 243
        ExplicitTop = 58
        ExplicitWidth = 809
        ExplicitHeight = 26
      end
      inherited Lb_Emp_Fones: TQRLabel
        Left = 243
        Top = 86
        Width = 809
        Height = 26
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          150.812500000000000000
          1426.104166666667000000)
        FontSize = 9
        ExplicitLeft = 243
        ExplicitTop = 86
        ExplicitWidth = 809
        ExplicitHeight = 26
      end
      inherited Lb_Emp_www: TQRLabel
        Left = 243
        Top = 140
        Width = 809
        Height = 26
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          246.062500000000000000
          1426.104166666667000000)
        FontSize = 9
        ExplicitLeft = 243
        ExplicitTop = 140
        ExplicitWidth = 809
        ExplicitHeight = 26
      end
      inherited Lb_Emp_email: TQRLabel
        Left = 243
        Top = 112
        Width = 809
        Height = 26
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          198.437500000000000000
          1426.104166666667000000)
        FontSize = 9
        ExplicitLeft = 243
        ExplicitTop = 112
        ExplicitWidth = 809
        ExplicitHeight = 26
      end
    end
    inherited Detalhe: TQRBand
      Left = 28
      Top = 310
      Width = 1134
      Height = 22
      BeforePrint = DetalheBeforePrint
      Size.Values = (
        38.805555555555560000
        2000.250000000000000000)
      ExplicitLeft = 28
      ExplicitTop = 310
      ExplicitWidth = 1134
      ExplicitHeight = 22
      inherited e_VL_Empresa: TQRDBText
        Left = 859
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1515.180555555556000000
          1.763888888888889000
          158.750000000000000000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 859
        ExplicitWidth = 90
        ExplicitHeight = 19
      end
      inherited E_Vencimento: TQRDBText
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1.763888888888889000
          1.763888888888889000
          158.750000000000000000)
        Font.Height = -9
        FontSize = 7
        ExplicitWidth = 90
        ExplicitHeight = 19
      end
      inherited E_Valor_BRuto: TQRDBText
        Left = 677
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1194.152777777778000000
          1.763888888888889000
          158.750000000000000000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 677
        ExplicitWidth = 90
        ExplicitHeight = 19
      end
      inherited E_AGencia: TQRDBText
        Left = 259
        Width = 210
        Height = 19
        Size.Values = (
          33.513888888888890000
          456.847222222222200000
          1.763888888888889000
          370.416666666666700000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 259
        ExplicitWidth = 210
        ExplicitHeight = 19
      end
      inherited E_PI_Interna: TQRDBText
        Left = 176
        Width = 80
        Height = 19
        Size.Values = (
          33.513888888888890000
          310.444444444444400000
          1.763888888888889000
          141.111111111111100000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 176
        ExplicitWidth = 80
        ExplicitHeight = 19
      end
      inherited E_Anunciante: TQRDBText
        Left = 470
        Width = 206
        Height = 19
        Size.Values = (
          33.513888888888890000
          829.027777777777800000
          1.763888888888889000
          363.361111111111100000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 470
        ExplicitWidth = 206
        ExplicitHeight = 19
      end
      inherited E_PI_Original: TQRDBText
        Left = 92
        Width = 80
        Height = 19
        Size.Values = (
          33.513888888888890000
          162.277777777777800000
          1.763888888888889000
          141.111111111111100000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 92
        ExplicitWidth = 80
        ExplicitHeight = 19
      end
      inherited E_Valor_Liquido: TQRDBText
        Left = 768
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1354.666666666667000000
          1.763888888888889000
          158.750000000000000000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 768
        ExplicitWidth = 90
        ExplicitHeight = 19
      end
      object E_Vl_fechado: TQRLabel
        Left = 1041
        Top = 1
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1836.208333333333000000
          1.763888888888889000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'E_Vl_fechado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object e_VL_Aberto: TQRLabel
        Left = 950
        Top = 1
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1675.694444444444000000
          1.763888888888889000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'E_VL_Aberto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
    end
    inherited Sumario: TQRBand
      Left = 28
      Top = 361
      Width = 1134
      Height = 126
      BeforePrint = SumarioBeforePrint
      Size.Values = (
        222.250000000000000000
        2000.250000000000000000)
      ExplicitLeft = 28
      ExplicitTop = 361
      ExplicitWidth = 1134
      ExplicitHeight = 126
      inherited QRLabel4: TQRLabel
        Left = 470
        Width = 206
        Height = 19
        Size.Values = (
          33.513888888888890000
          829.027777777777800000
          1.763888888888889000
          363.361111111111100000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 470
        ExplicitWidth = 206
        ExplicitHeight = 19
      end
      inherited E_TL_VL_Empresa: TQRExpr
        Left = 859
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1515.180555555556000000
          1.763888888888889000
          158.750000000000000000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 859
        ExplicitWidth = 90
        ExplicitHeight = 19
      end
      inherited E_TL_VL_BRuto: TQRExpr
        Left = 677
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1194.152777777778000000
          1.763888888888889000
          158.750000000000000000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 677
        ExplicitWidth = 90
        ExplicitHeight = 19
      end
      inherited E_TL_VL_Liquido: TQRExpr
        Left = 768
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1354.666666666667000000
          1.763888888888889000
          158.750000000000000000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 768
        ExplicitWidth = 90
        ExplicitHeight = 19
      end
      object E_TL_Vl_Aberto: TQRLabel
        Left = 950
        Top = 1
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1675.694444444444000000
          1.763888888888889000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'E_TL_Vl_Aberto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object E_TL_Vl_Fechado: TQRLabel
        Left = 1041
        Top = 1
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1836.208333333333000000
          1.763888888888889000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'E_TL_Vl_Fechado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
    end
    inherited QRBand3: TQRBand
      Left = 28
      Top = 487
      Width = 1134
      Height = 36
      Size.Values = (
        63.500000000000000000
        2000.250000000000000000)
      ExplicitLeft = 28
      ExplicitTop = 487
      ExplicitWidth = 1134
      ExplicitHeight = 36
      inherited QRSysData1: TQRSysData
        Left = 218
        Top = 4
        Width = 84
        Height = 26
        Size.Values = (
          45.861111111111110000
          384.527777777777800000
          7.055555555555556000
          148.166666666666700000)
        FontSize = 8
        ExplicitLeft = 218
        ExplicitTop = 4
        ExplicitWidth = 84
        ExplicitHeight = 26
      end
      inherited QRSysData2: TQRSysData
        Left = 1008
        Top = 4
        Width = 66
        Height = 26
        Size.Values = (
          44.979166666666700000
          1778.000000000000000000
          7.937500000000000000
          116.416666666667000000)
        FontSize = 8
        ExplicitLeft = 1008
        ExplicitTop = 4
        ExplicitWidth = 66
        ExplicitHeight = 26
      end
      inherited QRLabel22: TQRLabel
        Left = 918
        Top = 4
        Width = 77
        Height = 26
        Size.Values = (
          45.861111111111110000
          1619.250000000000000000
          7.055555555555556000
          135.819444444444400000)
        FontSize = 8
        ExplicitLeft = 918
        ExplicitTop = 4
        ExplicitWidth = 77
        ExplicitHeight = 26
      end
      inherited QRLabel23: TQRLabel
        Left = 4
        Top = 6
        Width = 179
        Height = 26
        Size.Values = (
          45.861111111111110000
          7.055555555555556000
          10.583333333333330000
          315.736111111111100000)
        FontSize = 8
        ExplicitLeft = 4
        ExplicitTop = 6
        ExplicitWidth = 179
        ExplicitHeight = 26
      end
    end
    inherited Grp_Veiculo: TQRGroup
      Left = 28
      Top = 251
      Width = 1134
      Height = 59
      Size.Values = (
        104.069444444444400000
        2000.250000000000000000)
      ExplicitLeft = 28
      ExplicitTop = 251
      ExplicitWidth = 1134
      ExplicitHeight = 59
      inherited Lb_Veiculo: TQRLabel
        Width = 1130
        Height = 32
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          2.645833333333333000
          1992.312500000000000000)
        FontSize = 10
        ExplicitWidth = 1130
        ExplicitHeight = 32
      end
      inherited E_Veiculo: TQRDBText
        Left = 78
        Width = 436
        Height = 27
        Size.Values = (
          47.625000000000000000
          137.583333333333300000
          2.645833333333333000
          769.937500000000000000)
        FontSize = 10
        ExplicitLeft = 78
        ExplicitWidth = 436
        ExplicitHeight = 27
      end
      inherited Lb_PI_Agencia: TQRLabel
        Left = 859
        Top = 37
        Width = 90
        Height = 20
        Size.Values = (
          35.277777777777780000
          1515.180555555556000000
          65.263888888888900000
          158.750000000000000000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 859
        ExplicitTop = 37
        ExplicitWidth = 90
        ExplicitHeight = 20
      end
      inherited Lb_Dt_Vencimento: TQRLabel
        Left = 2
        Top = 37
        Width = 90
        Height = 20
        Size.Values = (
          35.277777777777780000
          3.527777777777778000
          65.263888888888900000
          158.750000000000000000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 2
        ExplicitTop = 37
        ExplicitWidth = 90
        ExplicitHeight = 20
      end
      inherited Lb_Valor_Bruto: TQRLabel
        Left = 677
        Top = 37
        Width = 90
        Height = 20
        Size.Values = (
          35.277777777777780000
          1194.152777777778000000
          65.263888888888900000
          158.750000000000000000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 677
        ExplicitTop = 37
        ExplicitWidth = 90
        ExplicitHeight = 20
      end
      inherited Lb_Agencia: TQRLabel
        Left = 259
        Top = 37
        Width = 210
        Height = 20
        Size.Values = (
          35.277777777777780000
          456.847222222222200000
          65.263888888888900000
          370.416666666666700000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 259
        ExplicitTop = 37
        ExplicitWidth = 210
        ExplicitHeight = 20
      end
      inherited Lb_PI_Interna: TQRLabel
        Left = 176
        Top = 37
        Width = 80
        Height = 20
        Size.Values = (
          35.277777777777780000
          310.444444444444400000
          65.263888888888900000
          141.111111111111100000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 176
        ExplicitTop = 37
        ExplicitWidth = 80
        ExplicitHeight = 20
      end
      inherited Lb_Anunciante: TQRLabel
        Left = 470
        Top = 37
        Width = 206
        Height = 20
        Size.Values = (
          35.277777777777780000
          829.027777777777800000
          65.263888888888900000
          363.361111111111100000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 470
        ExplicitTop = 37
        ExplicitWidth = 206
        ExplicitHeight = 20
      end
      inherited E_Cidade: TQRDBText
        Left = 602
        Width = 456
        Height = 27
        Size.Values = (
          47.625000000000000000
          1060.979166666667000000
          2.645833333333333000
          804.333333333333200000)
        FontSize = 10
        ExplicitLeft = 602
        ExplicitWidth = 456
        ExplicitHeight = 27
      end
      inherited Lb_Cidade: TQRLabel
        Left = 523
        Width = 75
        Height = 27
        Size.Values = (
          47.625000000000000000
          923.395833333333200000
          2.645833333333333000
          132.291666666666700000)
        FontSize = 10
        ExplicitLeft = 523
        ExplicitWidth = 75
        ExplicitHeight = 27
      end
      inherited Lb_Pi_Original: TQRLabel
        Left = 92
        Top = 37
        Width = 80
        Height = 20
        Size.Values = (
          35.277777777777780000
          162.277777777777800000
          65.263888888888900000
          141.111111111111100000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 92
        ExplicitTop = 37
        ExplicitWidth = 80
        ExplicitHeight = 20
      end
      inherited Lb_Valor_Liquido: TQRLabel
        Left = 768
        Top = 37
        Width = 90
        Height = 20
        Size.Values = (
          35.277777777777780000
          1354.666666666667000000
          65.263888888888900000
          158.750000000000000000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 768
        ExplicitTop = 37
        ExplicitWidth = 90
        ExplicitHeight = 20
      end
      object Lb_Aberto: TQRLabel
        Left = 950
        Top = 37
        Width = 90
        Height = 20
        Size.Values = (
          35.277777777777780000
          1675.694444444444000000
          65.263888888888900000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Aberto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object Lb_Fechado: TQRLabel
        Left = 1041
        Top = 37
        Width = 90
        Height = 20
        Size.Values = (
          35.277777777777780000
          1836.208333333333000000
          65.263888888888900000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Fechado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
    end
    inherited Fte_Veiculo: TQRBand
      Left = 28
      Top = 332
      Width = 1134
      Height = 29
      BeforePrint = Fte_VeiculoBeforePrint
      Size.Values = (
        51.152777777777780000
        2000.250000000000000000)
      ExplicitLeft = 28
      ExplicitTop = 332
      ExplicitWidth = 1134
      ExplicitHeight = 29
      inherited QRLabel14: TQRLabel
        Left = 470
        Top = 3
        Width = 206
        Height = 19
        Size.Values = (
          33.513888888888890000
          829.027777777777800000
          5.291666666666667000
          363.361111111111100000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 470
        ExplicitTop = 3
        ExplicitWidth = 206
        ExplicitHeight = 19
      end
      inherited E_Sb_VL_Empresa: TQRExpr
        Left = 859
        Top = 3
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1515.180555555556000000
          5.291666666666667000
          158.750000000000000000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 859
        ExplicitTop = 3
        ExplicitWidth = 90
        ExplicitHeight = 19
      end
      inherited E_Sb_VL_Bruto: TQRExpr
        Left = 677
        Top = 3
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1194.152777777778000000
          5.291666666666667000
          158.750000000000000000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 677
        ExplicitTop = 3
        ExplicitWidth = 90
        ExplicitHeight = 19
      end
      inherited E_Sb_VL_Liquido: TQRExpr
        Left = 768
        Top = 3
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1354.666666666667000000
          5.291666666666667000
          158.750000000000000000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 768
        ExplicitTop = 3
        ExplicitWidth = 90
        ExplicitHeight = 19
      end
      object E_Sb_Vl_Aberto: TQRLabel
        Left = 950
        Top = 3
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1675.694444444444000000
          5.291666666666667000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'E_Sb_Vl_Aberto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object E_Sb_Vl_Fechado: TQRLabel
        Left = 1041
        Top = 3
        Width = 90
        Height = 19
        Size.Values = (
          33.513888888888890000
          1836.208333333333000000
          5.291666666666667000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'E_Sb_Vl_Fechado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
    end
  end
  inherited Qry: TFDQuery
    SQL.Strings = (
      
        'SELECT brd.nick_trade PDI_VEICULO,brd.name_company PDI_RAZAOVEIC' +
        'ULO , opi.nr_original, opi.nr_internal, opi.id, age.nick_trade P' +
        'DI_AGENCIA,'
      
        'adv.nick_trade PDI_ANUNCIANTE, opi.gross_value, opi.kickback_val' +
        'ue, opi.owner_value, opi.net_value, '
      
        'opi.dt_expiration, fn.tb_order_id, fnp.dt_payment, fnb.kind, fn.' +
        'tag_value ,ct.name, inv.number, fnp.paid_value'
      'from tb_order_pi opi '
      'inner join tb_entity brd    '
      'on (brd.id = opi.tb_broadcaster_id )     '
      'inner join tb_address ad                                    '
      'on (ad.id = brd.id)                                         '
      'inner join tb_city ct                                       '
      'on (ad.tb_city_id = ct.id)                                  '
      'inner join tb_entity age    '
      'on (age.id = opi.tb_agency_id )    '
      'inner join tb_entity adv    '
      'on (adv.id = opi.tb_advertiser_id)'
      'INNER JOIN  tb_invoice  inv'
      'ON (opi.id = inv.id)'
      'and (opi.tb_institution_id = inv.tb_institution_id)'
      'INNER JOIN  tb_financial  fn   '
      'ON (opi.id = fn.tb_order_id)       '
      'and (opi.tb_institution_id = fn.tb_institution_id)   '
      'INNER JOIN  tb_financial_bills  fnb   '
      'ON (fn.tb_order_id = fnb.tb_order_id)       '
      'and (fn.tb_institution_id  = fnb.tb_institution_id)       '
      'and (fn.terminal           = fnb.terminal)       '
      'and (fn.parcel             = fnb.parcel)   '
      'left outer join tb_financial_payment fnp   '
      'ON (fnb.tb_order_id = fnp.tb_order_id)       '
      'and (fnb.tb_institution_id = fnp.tb_institution_id)       '
      'and (fnb.terminal          = fnp.terminal)       '
      'and (fnb.parcel            = fnp.parcel) '
      'where (opi.tb_institution_id =16)  '
      'and (fnp.dt_payment is null)  '
      'AND ( opi.dt_internal between '#39'2018-11-01'#39' and '#39'2018-11-30'#39' )  '
      'order by ct.name,brd.nick_trade, opi.dt_expiration')
  end
end
