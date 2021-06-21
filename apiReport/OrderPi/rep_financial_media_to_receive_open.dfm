inherited RepFinancialMediaToRreceiveOpen: TRepFinancialMediaToRreceiveOpen
  Caption = 'Dados em Aberto'
  ExplicitHeight = 240
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
      Top = 236
      Size.Values = (
        55.562500000000000000
        2000.250000000000000000)
      ExplicitTop = 236
      inherited e_VL_Empresa: TQRDBText
        Size.Values = (
          44.979166666666670000
          1780.645833333333000000
          2.645833333333333000
          211.666666666666700000)
        FontSize = 8
      end
      inherited E_Vencimento: TQRDBText
        Size.Values = (
          44.979166666666670000
          2.645833333333333000
          2.645833333333333000
          185.208333333333300000)
        FontSize = 8
      end
      inherited E_Valor_BRuto: TQRDBText
        Size.Values = (
          44.979166666666670000
          1349.375000000000000000
          2.645833333333333000
          211.666666666666700000)
        FontSize = 8
      end
      inherited E_AGencia: TQRDBText
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          2.645833333333333000
          383.645833333333300000)
        FontSize = 8
      end
      inherited E_PI_Interna: TQRDBText
        Size.Values = (
          44.979166666666670000
          378.354166666666700000
          2.645833333333333000
          185.208333333333300000)
        FontSize = 8
      end
      inherited E_Anunciante: TQRDBText
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          2.645833333333333000
          383.645833333333300000)
        FontSize = 8
      end
      inherited E_PI_Original: TQRDBText
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          2.645833333333333000
          185.208333333333300000)
        FontSize = 8
      end
      inherited E_Valor_Liquido: TQRDBText
        Size.Values = (
          44.979166666666670000
          1563.687500000000000000
          2.645833333333333000
          211.666666666666700000)
        FontSize = 8
      end
    end
    inherited Sumario: TQRBand
      Top = 285
      Size.Values = (
        222.250000000000000000
        2000.250000000000000000)
      ExplicitTop = 285
      inherited QRLabel4: TQRLabel
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          2.645833333333333000
          383.645833333333300000)
        FontSize = 8
      end
      inherited E_TL_VL_Empresa: TQRExpr
        Size.Values = (
          44.979166666666670000
          1780.645833333333000000
          2.645833333333333000
          211.666666666666700000)
        FontSize = 8
      end
      inherited E_TL_VL_BRuto: TQRExpr
        Size.Values = (
          44.979166666666670000
          1349.375000000000000000
          2.645833333333333000
          211.666666666666700000)
        FontSize = 8
      end
      inherited E_TL_VL_Liquido: TQRExpr
        Size.Values = (
          44.979166666666670000
          1563.687500000000000000
          2.645833333333333000
          211.666666666666700000)
        FontSize = 8
      end
    end
    inherited QRBand3: TQRBand
      Top = 369
      Size.Values = (
        63.500000000000000000
        2000.250000000000000000)
      ExplicitTop = 369
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
    object QRBand1: TQRBand [4]
      Left = 19
      Top = 167
      Width = 756
      Height = 24
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = True
      ParentFont = False
      Size.Values = (
        63.500000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
    end
    inherited Grp_Veiculo: TQRGroup
      Top = 191
      Size.Values = (
        119.062500000000000000
        2000.250000000000000000)
      ExplicitTop = 191
      inherited Lb_Veiculo: TQRLabel
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          2.645833333333333000
          1992.312500000000000000)
        FontSize = 10
      end
      inherited E_Veiculo: TQRDBText
        Size.Values = (
          47.625000000000000000
          137.583333333333300000
          2.645833333333333000
          769.937500000000000000)
        FontSize = 10
      end
      inherited Lb_PI_Agencia: TQRLabel
        Size.Values = (
          44.979166666666670000
          1780.645833333333000000
          66.145833333333320000
          211.666666666666700000)
        FontSize = 8
      end
      inherited Lb_Dt_Vencimento: TQRLabel
        Size.Values = (
          44.979166666666670000
          2.645833333333333000
          66.145833333333320000
          185.208333333333300000)
        FontSize = 8
      end
      inherited Lb_Valor_Bruto: TQRLabel
        Size.Values = (
          44.979166666666670000
          1349.375000000000000000
          66.145833333333320000
          211.666666666666700000)
        FontSize = 8
      end
      inherited Lb_Agencia: TQRLabel
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          66.145833333333320000
          383.645833333333300000)
        FontSize = 8
      end
      inherited Lb_PI_Interna: TQRLabel
        Size.Values = (
          44.979166666666670000
          378.354166666666700000
          66.145833333333320000
          185.208333333333300000)
        FontSize = 8
      end
      inherited Lb_Anunciante: TQRLabel
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          66.145833333333320000
          383.645833333333300000)
        FontSize = 8
      end
      inherited E_Cidade: TQRDBText
        Size.Values = (
          47.625000000000000000
          1060.979166666667000000
          2.645833333333333000
          804.333333333333200000)
        FontSize = 10
      end
      inherited Lb_Cidade: TQRLabel
        Size.Values = (
          47.625000000000000000
          923.395833333333200000
          2.645833333333333000
          132.291666666666700000)
        FontSize = 10
      end
      inherited Lb_Pi_Original: TQRLabel
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          66.145833333333320000
          185.208333333333300000)
        FontSize = 8
      end
      inherited Lb_Valor_Liquido: TQRLabel
        Size.Values = (
          44.979166666666670000
          1563.687500000000000000
          66.145833333333320000
          211.666666666666700000)
        FontSize = 8
      end
    end
    inherited Fte_Veiculo: TQRBand
      Top = 257
      Size.Values = (
        74.083333333333340000
        2000.250000000000000000)
      ExplicitTop = 257
      inherited QRLabel14: TQRLabel
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          5.291666666666667000
          383.645833333333300000)
        FontSize = 8
      end
      inherited E_Sb_VL_Empresa: TQRExpr
        Size.Values = (
          44.979166666666670000
          1780.645833333333000000
          5.291666666666667000
          211.666666666666700000)
        FontSize = 8
      end
      inherited E_Sb_VL_Bruto: TQRExpr
        Size.Values = (
          44.979166666666670000
          1349.375000000000000000
          5.291666666666667000
          211.666666666666700000)
        FontSize = 8
      end
      inherited E_Sb_VL_Liquido: TQRExpr
        Size.Values = (
          44.979166666666670000
          1563.687500000000000000
          5.291666666666667000
          211.666666666666700000)
        FontSize = 8
      end
    end
  end
  inherited QrpPDF: TQRPDFFilter
    Left = 528
    Top = 39
  end
end
