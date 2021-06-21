inherited RepOrderListAdjust: TRepOrderListAdjust
  Caption = 'Lista de Ajustes de Estoque'
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
    ReportTitle = 'Rela'#231#227'o de pedidos de ajustes de estoque'
    inherited PageHeader: TQRBand
      Size.Values = (
        341.312500000000000000
        1899.708333333333000000)
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
    inherited Grp_Category: TQRGroup
      Size.Values = (
        74.083333333333340000
        1899.708333333333000000)
      Expression = 'Qry.dt_record'
      inherited lb_Entidade: TQRLabel
        Size.Values = (
          44.979166666666670000
          357.187500000000000000
          23.812500000000000000
          1301.750000000000000000)
        FontSize = 10
      end
      inherited Lb_Pedido: TQRLabel
        Size.Values = (
          44.979166666666670000
          171.979166666666700000
          23.812500000000000000
          169.333333333333300000)
        FontSize = 10
      end
      inherited Lb_Data: TQRLabel
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          23.812500000000000000
          156.104166666666700000)
        FontSize = 10
      end
      inherited Lb_Value: TQRLabel
        Size.Values = (
          44.979166666666670000
          1666.875000000000000000
          23.812500000000000000
          219.604166666666700000)
        FontSize = 10
      end
    end
    inherited Detail: TQRBand
      BeforePrint = DetailBeforePrint
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      inherited E_Entidade: TQRLabel
        Size.Values = (
          44.979166666666670000
          357.187500000000000000
          0.000000000000000000
          1301.750000000000000000)
        FontSize = 10
      end
      inherited E_Number: TQRLabel
        Size.Values = (
          44.979166666666670000
          171.979166666666700000
          0.000000000000000000
          169.333333333333300000)
        FontSize = 10
      end
      inherited E_Date: TQRLabel
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          0.000000000000000000
          156.104166666666700000)
        FontSize = 10
      end
      inherited E_Value: TQRLabel
        Size.Values = (
          44.979166666666670000
          1666.875000000000000000
          0.000000000000000000
          219.604166666666700000)
        FontSize = 10
      end
    end
    inherited Ft_Category: TQRBand
      BeforePrint = Ft_CategoryBeforePrint
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      inherited lb_Subtotal: TQRLabel
        Size.Values = (
          44.979166666666670000
          1399.645833333333000000
          13.229166666666670000
          142.875000000000000000)
        FontSize = 10
      end
      inherited E_Subtotal: TQRLabel
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          13.229166666666670000
          277.812500000000000000)
        FontSize = 10
      end
    end
    inherited QRBand3: TQRBand
      BeforePrint = QRBand3BeforePrint
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      inherited LB_Total: TQRLabel
        Size.Values = (
          44.979166666666670000
          1399.645833333333000000
          10.583333333333330000
          87.312500000000000000)
        FontSize = 10
      end
      inherited E_Total: TQRLabel
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          10.583333333333330000
          277.812500000000000000)
        FontSize = 10
      end
    end
  end
end
