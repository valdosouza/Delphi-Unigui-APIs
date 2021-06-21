inherited RepFinancialPayment: TRepFinancialPayment
  Caption = 'RepFinancialPayment'
  ExplicitWidth = 320
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
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    inherited PageHeader: TQRBand
      Height = 129
      Size.Values = (
        341.312500000000000000
        1899.708333333333000000)
      ExplicitHeight = 129
      inherited E_Titulo: TQRLabel
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          293.687500000000000000
          1899.708333333333000000)
        FontSize = 10
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
      Top = 209
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      ExplicitTop = 209
      inherited E_Entidade: TQRLabel
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          2.645833333333333000
          902.229166666666800000)
        FontSize = 10
      end
      inherited E_Dt_Emission: TQRLabel
        Size.Values = (
          44.979166666666670000
          912.812500000000100000
          2.645833333333333000
          222.250000000000000000)
        FontSize = 10
      end
      inherited E_Value: TQRLabel
        Size.Values = (
          44.979166666666670000
          1648.354166666667000000
          2.645833333333333000
          235.479166666666700000)
        FontSize = 10
      end
      inherited E_Dt_Expiration: TQRLabel
        Size.Values = (
          44.979166666666670000
          1404.937500000000000000
          2.645833333333333000
          238.125000000000000000)
        FontSize = 10
      end
      inherited E_fin_Numero: TQRLabel
        Size.Values = (
          44.979166666666670000
          1140.354166666667000000
          2.645833333333333000
          259.291666666666700000)
        FontSize = 10
      end
    end
    inherited fp_SubTotal: TQRBand
      Top = 229
      Size.Values = (
        58.208333333333340000
        1899.708333333333000000)
      ExplicitTop = 229
      inherited Lb_Subtotal: TQRLabel
        Size.Values = (
          44.979166666666670000
          1272.645833333333000000
          5.291666666666667000
          243.416666666666700000)
        FontSize = 10
      end
      inherited E_Subtotal: TQRLabel
        Size.Values = (
          44.979166666666670000
          1656.291666666667000000
          5.291666666666667000
          235.479166666666700000)
        FontSize = 8
      end
    end
    inherited Sumario: TQRBand
      Top = 251
      Size.Values = (
        58.208333333333340000
        1899.708333333333000000)
      ExplicitTop = 251
      inherited Lb_Total: TQRLabel
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          5.291666666666667000
          187.854166666666700000)
        FontSize = 10
      end
      inherited E_Total: TQRLabel
        Size.Values = (
          44.979166666666670000
          1656.291666666667000000
          5.291666666666667000
          235.479166666666700000)
        FontSize = 8
      end
    end
    inherited Grupo1: TQRGroup
      Top = 167
      Size.Values = (
        111.125000000000000000
        1899.708333333333000000)
      ExplicitTop = 167
      inherited E_grp_Expiration: TQRLabel
        Size.Values = (
          52.916666666666670000
          7.937500000000000000
          2.645833333333333000
          523.875000000000000000)
        FontSize = 12
      end
      inherited Lb_Entidade: TQRLabel
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          58.208333333333340000
          902.229166666666800000)
        FontSize = 10
      end
      inherited Lb_Dt_Emission: TQRLabel
        Size.Values = (
          44.979166666666670000
          912.812500000000100000
          58.208333333333340000
          222.250000000000000000)
        FontSize = 10
      end
      inherited Lb_Value: TQRLabel
        Size.Values = (
          44.979166666666670000
          1648.354166666667000000
          58.208333333333340000
          235.479166666666700000)
        FontSize = 10
      end
      inherited Lb_Dt_Expiration: TQRLabel
        Size.Values = (
          44.979166666666670000
          1404.937500000000000000
          58.208333333333340000
          238.125000000000000000)
        FontSize = 10
      end
      inherited Lb_Fin_Numero: TQRLabel
        Size.Values = (
          44.979166666666670000
          1140.354166666667000000
          58.208333333333340000
          259.291666666666700000)
        FontSize = 10
      end
    end
  end
end
