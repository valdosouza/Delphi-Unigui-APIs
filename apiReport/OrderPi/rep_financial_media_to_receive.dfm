inherited RepFinancialMediaToReceive: TRepFinancialMediaToReceive
  Caption = 'Contas '#224' Receber'
  ClientHeight = 634
  ExplicitWidth = 884
  ExplicitHeight = 673
  PixelsPerInch = 96
  TextHeight = 13
  inherited Qrpt: TQuickRep
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
    inherited PageHeader: TQRBand
      Left = 19
      Width = 756
      Height = 132
      Size.Values = (
        349.250000000000000000
        2000.250000000000000000)
      ExplicitLeft = 19
      ExplicitWidth = 756
      ExplicitHeight = 132
      inherited E_Titulo: TQRLabel
        Width = 753
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          293.687500000000000000
          1992.312500000000000000)
        FontSize = 10
        ExplicitWidth = 753
      end
      inherited Img_Logo: TQRImage
        Size.Values = (
          275.166666666666700000
          18.520833333333330000
          10.583333333333330000
          396.875000000000000000)
      end
      inherited Lb_Emp_Nome: TQRLabel
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          5.291666666666667000
          1426.104166666667000000)
        FontSize = 9
      end
      inherited Lb_Emp_Doc: TQRLabel
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          52.916666666666660000
          1426.104166666667000000)
        FontSize = 9
      end
      inherited Lb_Emp_End: TQRLabel
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          103.187500000000000000
          1426.104166666667000000)
        FontSize = 9
      end
      inherited Lb_Emp_Fones: TQRLabel
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          150.812500000000000000
          1426.104166666667000000)
        FontSize = 9
      end
      inherited Lb_Emp_www: TQRLabel
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          246.062500000000000000
          1426.104166666667000000)
        FontSize = 9
      end
      inherited Lb_Emp_email: TQRLabel
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          198.437500000000000000
          1426.104166666667000000)
        FontSize = 9
      end
    end
    object Detalhe: TQRBand
      Left = 19
      Top = 215
      Width = 756
      Height = 21
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = Grp_Veiculo
      ParentFont = False
      Size.Values = (
        55.562500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object e_VL_Empresa: TQRDBText
        Left = 673
        Top = 1
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1780.645833333333000000
          2.645833333333333000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qry
        DataField = 'owner_value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object E_Vencimento: TQRDBText
        Left = 1
        Top = 1
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          2.645833333333333000
          2.645833333333333000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qry
        DataField = 'dt_expiration'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object E_Valor_BRuto: TQRDBText
        Left = 510
        Top = 1
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1349.375000000000000000
          2.645833333333333000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qry
        DataField = 'gross_value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object E_AGencia: TQRDBText
        Left = 216
        Top = 1
        Width = 145
        Height = 17
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          2.645833333333333000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qry
        DataField = 'PDI_AGENCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object E_PI_Interna: TQRDBText
        Left = 143
        Top = 1
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          378.354166666666700000
          2.645833333333333000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qry
        DataField = 'nr_internal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object E_Anunciante: TQRDBText
        Left = 360
        Top = 1
        Width = 145
        Height = 17
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          2.645833333333333000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qry
        DataField = 'PDI_ANUNCIANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object E_PI_Original: TQRDBText
        Left = 72
        Top = 1
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          2.645833333333333000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qry
        DataField = 'nr_original'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object E_Valor_Liquido: TQRDBText
        Left = 591
        Top = 1
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1563.687500000000000000
          2.645833333333333000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qry
        DataField = 'net_value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object Sumario: TQRBand
      Left = 19
      Top = 264
      Width = 756
      Height = 84
      Frame.DrawTop = True
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        222.250000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel4: TQRLabel
        Left = 360
        Top = 1
        Width = 145
        Height = 17
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          2.645833333333333000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Valores Totais'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object E_TL_VL_Empresa: TQRExpr
        Left = 673
        Top = 1
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1780.645833333333000000
          2.645833333333333000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Qry.owner_value)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object E_TL_VL_BRuto: TQRExpr
        Left = 510
        Top = 1
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1349.375000000000000000
          2.645833333333333000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'sum(Qry.gross_value)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object E_TL_VL_Liquido: TQRExpr
        Left = 591
        Top = 1
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1563.687500000000000000
          2.645833333333333000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'sum(Qry.net_value)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 348
      Width = 756
      Height = 24
      Frame.DrawTop = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRSysData1: TQRSysData
        Left = 145
        Top = 3
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          383.645833333333300000
          7.937500000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 706
        Top = 3
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          1867.958333333333000000
          7.937500000000000000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 646
        Top = 3
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          1709.208333333333000000
          7.937500000000000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pagina N'#186
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 3
        Top = 4
        Width = 119
        Height = 17
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          10.583333333333330000
          314.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Relat'#243'rio emitido em:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object Grp_Veiculo: TQRGroup
      Left = 19
      Top = 170
      Width = 756
      Height = 45
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        119.062500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Qry.PDI_VEICULO'
      FooterBand = Fte_Veiculo
      Master = Qrpt
      ReprintOnNewPage = True
      object Lb_Veiculo: TQRLabel
        Left = 0
        Top = 1
        Width = 753
        Height = 21
        Frame.DrawBottom = True
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          2.645833333333333000
          1992.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Nome:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object E_Veiculo: TQRDBText
        Left = 52
        Top = 1
        Width = 291
        Height = 18
        Size.Values = (
          47.625000000000000000
          137.583333333333300000
          2.645833333333333000
          769.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qry
        DataField = 'PDI_VEICULO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object Lb_PI_Agencia: TQRLabel
        Left = 673
        Top = 25
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1780.645833333333000000
          66.145833333333320000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Empresa'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object Lb_Dt_Vencimento: TQRLabel
        Left = 1
        Top = 25
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          2.645833333333333000
          66.145833333333320000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vencimento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object Lb_Valor_Bruto: TQRLabel
        Left = 510
        Top = 25
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1349.375000000000000000
          66.145833333333320000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor Bruto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object Lb_Agencia: TQRLabel
        Left = 216
        Top = 25
        Width = 145
        Height = 17
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          66.145833333333320000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Ag'#234'ncia'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object Lb_PI_Interna: TQRLabel
        Left = 143
        Top = 25
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          378.354166666666700000
          66.145833333333320000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'P.I. Interna'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object Lb_Anunciante: TQRLabel
        Left = 360
        Top = 25
        Width = 145
        Height = 17
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          66.145833333333320000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Anunciante'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object E_Cidade: TQRDBText
        Left = 401
        Top = 1
        Width = 304
        Height = 18
        Size.Values = (
          47.625000000000000000
          1060.979166666667000000
          2.645833333333333000
          804.333333333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qry
        DataField = 'name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object Lb_Cidade: TQRLabel
        Left = 349
        Top = 1
        Width = 50
        Height = 18
        Size.Values = (
          47.625000000000000000
          923.395833333333200000
          2.645833333333333000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cidade:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object Lb_Pi_Original: TQRLabel
        Left = 72
        Top = 25
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          66.145833333333320000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'P.I. Original'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object Lb_Valor_Liquido: TQRLabel
        Left = 591
        Top = 25
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1563.687500000000000000
          66.145833333333320000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor Liquido'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object Fte_Veiculo: TQRBand
      Left = 19
      Top = 236
      Width = 756
      Height = 28
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = Grp_Veiculo
      Size.Values = (
        74.083333333333320000
        2000.250000000000000000)
      PreCaluculateBandHeight = True
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel14: TQRLabel
        Left = 360
        Top = 2
        Width = 145
        Height = 17
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          5.291666666666667000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Valores Subtotais'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object E_Sb_VL_Empresa: TQRExpr
        Left = 673
        Top = 2
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1780.645833333333000000
          5.291666666666667000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'Sum(Qry.owner_value)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object E_Sb_VL_Bruto: TQRExpr
        Left = 510
        Top = 2
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1349.375000000000000000
          5.291666666666667000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'sum(Qry.gross_value)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object E_Sb_VL_Liquido: TQRExpr
        Left = 591
        Top = 2
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1563.687500000000000000
          5.291666666666667000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'sum(Qry.net_value)'
        Mask = '#,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
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
      'AND ( opi.dt_internal between '#39'2018-11-30'#39' and '#39'2018-11-30'#39' )  '
      'order by ct.name,brd.nick_trade, opi.dt_expiration')
    object QryPDI_VEICULO: TStringField
      FieldName = 'PDI_VEICULO'
      Origin = 'PDI_VEICULO'
      Required = True
      Size = 100
    end
    object Qrynr_original: TStringField
      FieldName = 'nr_original'
      Origin = 'nr_original'
      Size = 30
    end
    object Qrynr_internal: TIntegerField
      FieldName = 'nr_internal'
      Origin = 'nr_internal'
    end
    object Qryid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryPDI_AGENCIA: TStringField
      FieldName = 'PDI_AGENCIA'
      Origin = 'PDI_AGENCIA'
      Required = True
      Size = 100
    end
    object QryPDI_ANUNCIANTE: TStringField
      FieldName = 'PDI_ANUNCIANTE'
      Origin = 'PDI_ANUNCIANTE'
      Required = True
      Size = 100
    end
    object Qrygross_value: TBCDField
      FieldName = 'gross_value'
      Origin = 'gross_value'
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object Qrykickback_value: TBCDField
      FieldName = 'kickback_value'
      Origin = 'kickback_value'
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object Qryowner_value: TBCDField
      FieldName = 'owner_value'
      Origin = 'owner_value'
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object Qrynet_value: TBCDField
      FieldName = 'net_value'
      Origin = 'net_value'
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object Qrydt_expiration: TDateField
      FieldName = 'dt_expiration'
      Origin = 'dt_expiration'
    end
    object Qrytb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Origin = 'tb_order_id'
      Required = True
    end
    object Qrydt_payment: TDateField
      FieldName = 'dt_payment'
      Origin = 'dt_payment'
    end
    object Qrykind: TStringField
      FieldName = 'kind'
      Origin = 'kind'
      Size = 2
    end
    object Qrytag_value: TBCDField
      FieldName = 'tag_value'
      Origin = 'tag_value'
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object Qryname: TStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 100
    end
    object QryPDI_RAZAOVEICULO: TStringField
      FieldName = 'PDI_RAZAOVEICULO'
      Origin = 'PDI_RAZAOVEICULO'
      Required = True
      Size = 100
    end
    object Qrynumber: TStringField
      FieldName = 'number'
      Origin = 'number'
      Size = 10
    end
    object Qrypaid_value: TBCDField
      FieldName = 'paid_value'
      Origin = 'paid_value'
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
  end
  object Qr_Acao: TFDQuery
    Filtered = True
    SQL.Strings = (
      
        'SELECT brd.nick_trade PDI_VEICULO, opi.nr_original, opi.nr_inter' +
        'nal, opi.id, '
      
        'age.nick_trade PDI_AGENCIA, adv.nick_trade PDI_ANUNCIANTE, opi.g' +
        'ross_value, '
      
        'opi.kickback_value, opi.owner_value, opi.net_value, opi.dt_expir' +
        'ation, '
      'fn.tb_order_id, fnp.dt_payment, fnb.kind, fn.tag_value '
      'from tb_order_pi opi '
      ' inner join tb_entity brd    '
      ' on (brd.id = opi.tb_broadcaster_id )    '
      ' inner join tb_entity age    '
      ' on (age.id = opi.tb_agency_id )    '
      ' inner join tb_entity adv    '
      ' on (adv.id = opi.tb_advertiser_id)   '
      ' '
      ' INNER JOIN  tb_financial  fn   '
      ' ON (opi.id = fn.tb_order_id)       '
      ' and (opi.tb_institution_id = fn.tb_institution_id)   '
      ' '
      ' INNER JOIN  tb_financial_bills  fnb   '
      ' ON (fn.tb_order_id = fnb.tb_order_id)       '
      ' and (fn.tb_institution_id  = fnb.tb_institution_id)       '
      ' and (fn.terminal           = fnb.terminal)       '
      ' and (fn.parcel             = fnb.parcel)   '
      ' '
      ' left outer join tb_financial_payment fnp   '
      ' ON (fnb.tb_order_id = fnp.tb_order_id)       '
      ' and (fnb.tb_institution_id = fnp.tb_institution_id)       '
      ' and (fnb.terminal          = fnp.terminal)       '
      ' and (fnb.parcel            = fnp.parcel) '
      ' '
      ' where (opi.tb_institution_id =16)  '
      ' AND ( opi.dt_internal between '#39'2019-01-01'#39' and '#39'2019-02-18'#39' )')
    Left = 80
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = Qry
    Left = 432
    Top = 320
  end
end
