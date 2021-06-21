inherited FrxBaseReportList: TFrxBaseReportList
  Caption = 'BaseReportList'
  ClientHeight = 187
  ClientWidth = 268
  ExplicitWidth = 284
  ExplicitHeight = 226
  PixelsPerInch = 96
  TextHeight = 13
  inherited frxBase: TfrxReport
    ReportOptions.LastChange = 43375.717090798620000000
    Datasets = <
      item
        DataSet = frxDBaseReport
        DataSetName = 'frxDBaseReport'
      end>
    Variables = <
      item
        Name = ' CabecalhoEmpresa'
        Value = Null
      end
      item
        Name = 'NomeFantasia'
        Value = Null
      end
      item
        Name = 'DocFiscal'
        Value = Null
      end
      item
        Name = 'Endereco'
        Value = Null
      end
      item
        Name = 'Fones'
        Value = Null
      end
      item
        Name = 'email'
        Value = Null
      end
      item
        Name = 'website'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = Null
      end
      item
        Name = ' Footer'
        Value = Null
      end
      item
        Name = 'SumProduct'
        Value = Null
      end
      item
        Name = 'SumService'
        Value = Null
      end
      item
        Name = ' General'
        Value = Null
      end
      item
        Name = 'StrConnection'
        Value = ''
      end>
    Style = <>
    inherited Page1: TfrxReportPage
      OnBeforePrint = ''
      inherited PageFooter1: TfrxPageFooter
        Top = 207.874150000000000000
        inherited Memo39: TfrxMemoView
          Memo.UTF8W = (
            '[<Date>] -[<Time>]')
          Formats = <
            item
              FormatStr = 'mm.dd.yyyy'
              Kind = fkDateTime
            end
            item
            end
            item
              FormatStr = 'mm.dd.yyyy'
              Kind = fkDateTime
            end
            item
            end>
        end
        inherited Memo40: TfrxMemoView
          Top = 2.220470000000006000
          Memo.UTF8W = (
            '[<Page>]/[<TotalPages>]')
        end
        inherited Memo41: TfrxMemoView
          Top = 2.220470000000006000
          Memo.UTF8W = (
            'Pagina N'#186)
        end
        inherited Memo42: TfrxMemoView
          Memo.UTF8W = (
            'Relat'#243'rio emitido em:')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 129.000000000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object lbTitulo: TfrxMemoView
          Align = baWidth
          Top = 111.000000000000000000
          Width = 718.110700000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.TopLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          Memo.UTF8W = (
            '[Titulo]')
          ParentFont = False
        end
        object Logo: TfrxPictureView
          Left = 7.000000000000000000
          Top = 4.000000000000000000
          Width = 150.000000000000000000
          Height = 104.000000000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object lbDocFiscal: TfrxMemoView
          Left = 162.000000000000000000
          Top = 20.000000000000000000
          Width = 539.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[DocFiscal]')
          ParentFont = False
        end
        object lbEndereco: TfrxMemoView
          Left = 162.000000000000000000
          Top = 39.000000000000000000
          Width = 539.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Endereco]')
          ParentFont = False
        end
        object lbFones: TfrxMemoView
          Left = 162.000000000000000000
          Top = 57.000000000000000000
          Width = 539.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Fones]')
          ParentFont = False
        end
        object lbWebSites: TfrxMemoView
          Left = 162.000000000000000000
          Top = 93.000000000000000000
          Width = 539.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[website]')
          ParentFont = False
        end
        object lbemail: TfrxMemoView
          Left = 162.000000000000000000
          Top = 75.000000000000000000
          Width = 539.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[email]')
          ParentFont = False
        end
        object lbNomeFantasia: TfrxMemoView
          Left = 161.740260000000000000
          Width = 539.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[NomeFantasia]')
          ParentFont = False
        end
      end
    end
  end
end
