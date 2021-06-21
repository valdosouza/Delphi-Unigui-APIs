inherited RepFinancialMediaToRreceiveClosed: TRepFinancialMediaToRreceiveClosed
  Caption = 'Dados Baixados'
  ClientWidth = 819
  ExplicitWidth = 835
  PixelsPerInch = 96
  TextHeight = 13
  inherited Qrpt: TQuickRep
    Left = 16
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
    ExplicitLeft = 16
    inherited PageHeader: TQRBand
      Height = 129
      Size.Values = (
        341.312500000000000000
        2000.250000000000000000)
      ExplicitHeight = 129
      inherited E_Titulo: TQRLabel
        Width = 756
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          293.687500000000000000
          2000.250000000000000000)
        FontSize = 10
        ExplicitWidth = 756
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
    inherited Detalhe: TQRBand
      Top = 212
      Height = 15
      Size.Values = (
        39.687500000000000000
        2000.250000000000000000)
      ExplicitTop = 212
      ExplicitHeight = 15
      inherited e_VL_Empresa: TQRDBText
        Left = 693
        Width = 60
        Height = 13
        Size.Values = (
          33.513888888888890000
          1832.680555555556000000
          1.763888888888889000
          158.750000000000000000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 693
        ExplicitWidth = 60
        ExplicitHeight = 13
      end
      inherited E_Vencimento: TQRDBText
        Width = 59
        Height = 13
        Size.Values = (
          33.513888888888890000
          1.763888888888889000
          1.763888888888889000
          155.222222222222200000)
        Font.Height = -9
        FontSize = 7
        ExplicitWidth = 59
        ExplicitHeight = 13
      end
      inherited E_Valor_BRuto: TQRDBText
        Left = 568
        Width = 60
        Height = 13
        Size.Values = (
          33.513888888888890000
          1502.833333333333000000
          1.763888888888889000
          158.750000000000000000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 568
        ExplicitWidth = 60
        ExplicitHeight = 13
      end
      inherited E_AGencia: TQRDBText
        Left = 289
        Width = 140
        Height = 13
        Size.Values = (
          33.513888888888890000
          765.527777777777800000
          1.763888888888889000
          370.416666666666700000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 289
        ExplicitWidth = 140
        ExplicitHeight = 13
      end
      inherited E_PI_Interna: TQRDBText
        Left = 234
        Width = 53
        Height = 13
        Size.Values = (
          33.513888888888890000
          619.125000000000000000
          1.763888888888889000
          141.111111111111100000)
        Alignment = taCenter
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 234
        ExplicitWidth = 53
        ExplicitHeight = 13
      end
      inherited E_Anunciante: TQRDBText
        Left = 433
        Width = 133
        Height = 13
        Size.Values = (
          33.513888888888890000
          1146.527777777778000000
          1.763888888888889000
          351.013888888888900000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 433
        ExplicitWidth = 133
        ExplicitHeight = 13
      end
      inherited E_PI_Original: TQRDBText
        Left = 179
        Width = 53
        Height = 13
        Size.Values = (
          33.513888888888890000
          472.722222222222200000
          1.763888888888889000
          141.111111111111100000)
        Alignment = taCenter
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 179
        ExplicitWidth = 53
        ExplicitHeight = 13
      end
      inherited E_Valor_Liquido: TQRDBText
        Left = 631
        Width = 60
        Height = 13
        Size.Values = (
          33.513888888888890000
          1670.402777777778000000
          1.763888888888889000
          158.750000000000000000)
        Font.Height = -9
        FontSize = 7
        ExplicitLeft = 631
        ExplicitWidth = 60
        ExplicitHeight = 13
      end
      object E_Data_Baixa: TQRDBText
        Left = 61
        Top = 0
        Width = 59
        Height = 13
        Size.Values = (
          33.513888888888890000
          162.277777777777800000
          0.000000000000000000
          155.222222222222200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qry
        DataField = 'dt_payment'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object E_Numero_NF: TQRDBText
        Left = 123
        Top = 0
        Width = 53
        Height = 13
        Size.Values = (
          33.513888888888890000
          326.319444444444400000
          0.000000000000000000
          141.111111111111100000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = Qry
        DataField = 'number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
    end
    inherited Sumario: TQRBand
      Top = 245
      Frame.DrawTop = False
      Size.Values = (
        222.250000000000000000
        2000.250000000000000000)
      ExplicitTop = 245
      inherited QRLabel4: TQRLabel
        Left = 433
        Width = 133
        Height = 13
        Size.Values = (
          33.513888888888890000
          1146.527777777778000000
          1.763888888888889000
          351.013888888888900000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 433
        ExplicitWidth = 133
        ExplicitHeight = 13
      end
      inherited E_TL_VL_Empresa: TQRExpr
        Left = 693
        Width = 60
        Height = 13
        Size.Values = (
          33.513888888888890000
          1832.680555555556000000
          1.763888888888889000
          158.750000000000000000)
        Font.Height = -9
        Mask = '#,##0.0'
        FontSize = 7
        ExplicitLeft = 693
        ExplicitWidth = 60
        ExplicitHeight = 13
      end
      inherited E_TL_VL_BRuto: TQRExpr
        Left = 568
        Width = 60
        Height = 13
        Size.Values = (
          33.513888888888890000
          1502.833333333333000000
          1.763888888888889000
          158.750000000000000000)
        Font.Height = -9
        Mask = '#,##0.0'
        FontSize = 7
        ExplicitLeft = 568
        ExplicitWidth = 60
        ExplicitHeight = 13
      end
      inherited E_TL_VL_Liquido: TQRExpr
        Left = 631
        Width = 60
        Height = 13
        Size.Values = (
          33.513888888888890000
          1670.402777777778000000
          1.763888888888889000
          158.750000000000000000)
        Font.Height = -9
        Mask = '#,##0.0'
        FontSize = 7
        ExplicitLeft = 631
        ExplicitWidth = 60
        ExplicitHeight = 13
      end
    end
    inherited QRBand3: TQRBand
      Top = 329
      Size.Values = (
        63.500000000000000000
        2000.250000000000000000)
      ExplicitTop = 329
      inherited QRSysData1: TQRSysData
        Size.Values = (
          44.979166666666670000
          383.645833333333300000
          7.937500000000000000
          148.166666666666700000)
        FontSize = 8
      end
      inherited QRSysData2: TQRSysData
        Left = 672
        Size.Values = (
          44.979166666666700000
          1778.000000000000000000
          7.937500000000000000
          116.416666666667000000)
        FontSize = 8
        ExplicitLeft = 672
      end
      inherited QRLabel22: TQRLabel
        Left = 612
        Size.Values = (
          44.979166666666670000
          1619.250000000000000000
          7.937500000000000000
          134.937500000000000000)
        FontSize = 8
        ExplicitLeft = 612
      end
      inherited QRLabel23: TQRLabel
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          10.583333333333330000
          314.854166666666700000)
        FontSize = 8
      end
    end
    inherited Grp_Veiculo: TQRGroup
      Top = 167
      Size.Values = (
        119.062500000000000000
        2000.250000000000000000)
      ReprintOnNewPage = False
      ExplicitTop = 167
      inherited Lb_Veiculo: TQRLabel
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          2.645833333333333000
          1992.312500000000000000)
        Font.Height = -11
        FontSize = 8
      end
      inherited E_Veiculo: TQRDBText
        Size.Values = (
          47.625000000000000000
          137.583333333333300000
          2.645833333333333000
          769.937500000000000000)
        Font.Height = -11
        FontSize = 8
      end
      inherited Lb_PI_Agencia: TQRLabel
        Left = 693
        Top = 26
        Width = 60
        Height = 13
        Size.Values = (
          33.513888888888890000
          1832.680555555556000000
          68.791666666666680000
          158.750000000000000000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 693
        ExplicitTop = 26
        ExplicitWidth = 60
        ExplicitHeight = 13
      end
      inherited Lb_Dt_Vencimento: TQRLabel
        Width = 59
        Height = 13
        Size.Values = (
          33.513888888888890000
          1.763888888888889000
          65.263888888888900000
          155.222222222222200000)
        Font.Height = -8
        FontSize = 6
        ExplicitWidth = 59
        ExplicitHeight = 13
      end
      inherited Lb_Valor_Bruto: TQRLabel
        Left = 568
        Top = 26
        Width = 60
        Height = 13
        Size.Values = (
          33.513888888888890000
          1502.833333333333000000
          68.791666666666680000
          158.750000000000000000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 568
        ExplicitTop = 26
        ExplicitWidth = 60
        ExplicitHeight = 13
      end
      inherited Lb_Agencia: TQRLabel
        Left = 289
        Top = 26
        Width = 140
        Height = 13
        Size.Values = (
          33.513888888888890000
          765.527777777777800000
          68.791666666666680000
          370.416666666666700000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 289
        ExplicitTop = 26
        ExplicitWidth = 140
        ExplicitHeight = 13
      end
      inherited Lb_PI_Interna: TQRLabel
        Left = 234
        Top = 26
        Width = 53
        Height = 13
        Size.Values = (
          33.513888888888890000
          619.125000000000000000
          68.791666666666680000
          141.111111111111100000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 234
        ExplicitTop = 26
        ExplicitWidth = 53
        ExplicitHeight = 13
      end
      inherited Lb_Anunciante: TQRLabel
        Left = 433
        Top = 26
        Width = 133
        Height = 13
        Size.Values = (
          33.513888888888890000
          1146.527777777778000000
          68.791666666666680000
          351.013888888888900000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 433
        ExplicitTop = 26
        ExplicitWidth = 133
        ExplicitHeight = 13
      end
      inherited E_Cidade: TQRDBText
        Size.Values = (
          47.625000000000000000
          1060.979166666667000000
          2.645833333333333000
          804.333333333333200000)
        Font.Height = -11
        FontSize = 8
      end
      inherited Lb_Cidade: TQRLabel
        Size.Values = (
          47.625000000000000000
          923.395833333333200000
          2.645833333333333000
          132.291666666666700000)
        Font.Height = -11
        FontSize = 8
      end
      inherited Lb_Pi_Original: TQRLabel
        Left = 179
        Top = 26
        Width = 53
        Height = 13
        Size.Values = (
          33.513888888888890000
          472.722222222222200000
          68.791666666666680000
          141.111111111111100000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 179
        ExplicitTop = 26
        ExplicitWidth = 53
        ExplicitHeight = 13
      end
      inherited Lb_Valor_Liquido: TQRLabel
        Left = 631
        Top = 26
        Width = 60
        Height = 13
        Size.Values = (
          33.513888888888890000
          1670.402777777778000000
          68.791666666666680000
          158.750000000000000000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 631
        ExplicitTop = 26
        ExplicitWidth = 60
        ExplicitHeight = 13
      end
      object Lb_Data_Baixa: TQRLabel
        Left = 61
        Top = 25
        Width = 59
        Height = 13
        Size.Values = (
          33.513888888888890000
          162.277777777777800000
          65.263888888888900000
          155.222222222222200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Data Baixa'
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
      object Lb_Numero_NF: TQRLabel
        Left = 123
        Top = 25
        Width = 53
        Height = 13
        Size.Values = (
          33.513888888888890000
          326.319444444444400000
          65.263888888888900000
          141.111111111111100000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'N'#250'mero NF'
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
      Top = 227
      Height = 18
      Frame.DrawBottom = True
      Size.Values = (
        47.625000000000000000
        2000.250000000000000000)
      ExplicitTop = 227
      ExplicitHeight = 18
      inherited QRLabel14: TQRLabel
        Left = 433
        Width = 133
        Height = 13
        Size.Values = (
          33.513888888888890000
          1146.527777777778000000
          5.291666666666667000
          351.013888888888900000)
        Font.Height = -8
        FontSize = 6
        ExplicitLeft = 433
        ExplicitWidth = 133
        ExplicitHeight = 13
      end
      inherited E_Sb_VL_Empresa: TQRExpr
        Left = 693
        Width = 60
        Height = 13
        Size.Values = (
          33.513888888888890000
          1832.680555555556000000
          5.291666666666667000
          158.750000000000000000)
        Font.Height = -9
        Mask = '#,##0.0'
        FontSize = 7
        ExplicitLeft = 693
        ExplicitWidth = 60
        ExplicitHeight = 13
      end
      inherited E_Sb_VL_Bruto: TQRExpr
        Left = 568
        Width = 60
        Height = 13
        Size.Values = (
          33.513888888888890000
          1502.833333333333000000
          5.291666666666667000
          158.750000000000000000)
        Font.Height = -9
        Mask = '#,##0.0'
        FontSize = 7
        ExplicitLeft = 568
        ExplicitWidth = 60
        ExplicitHeight = 13
      end
      inherited E_Sb_VL_Liquido: TQRExpr
        Left = 631
        Width = 60
        Height = 13
        Size.Values = (
          33.513888888888890000
          1670.402777777778000000
          5.291666666666667000
          158.750000000000000000)
        Font.Height = -9
        Mask = '#,##0.0'
        FontSize = 7
        ExplicitLeft = 631
        ExplicitWidth = 60
        ExplicitHeight = 13
      end
    end
  end
end
