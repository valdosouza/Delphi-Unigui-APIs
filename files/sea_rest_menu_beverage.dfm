inherited SeaRestMenuBeverage: TSeaRestMenuBeverage
  Caption = 'Card'#225'pio Bebidas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    inherited pc_search: TUniPageControl
      inherited tbs_search: TUniTabSheet
        inherited dbg_Search: TUniDBGrid
          Columns = <
            item
              FieldName = 'menu'
              Title.Caption = 'menu'
              Width = 416
            end
            item
              FieldName = 'subgrupo'
              Title.Caption = 'Subgrupo'
              Width = 330
              ReadOnly = True
            end
            item
              FieldName = 'link_url'
              Title.Caption = 'Imagem'
              Width = 124
              Alignment = taCenter
              ImageOptions.Visible = True
              ImageOptions.Width = 40
            end>
        end
      end
      inherited tbs_group_attribute: TUniTabSheet
        TabVisible = False
      end
      inherited tbs_group_measure: TUniTabSheet
        inherited pnl_measure: TUniPanel
          inherited dbg_measure: TUniDBGrid
            ReadOnly = True
            OnMouseDown = dbg_measureMouseDown
            OnDrawColumnCell = dbg_measureDrawColumnCell
            Columns = <
              item
                FieldName = 'measure'
                Title.Caption = 'Medida'
                Width = 128
                ReadOnly = True
              end
              item
                FieldName = 'price_tag'
                Title.Caption = 'Valor Unit'#225'rio'
                Width = 88
                ReadOnly = True
              end
              item
                FieldName = 'link_url'
                Title.Caption = 'Imagem'
                Width = 107
                Alignment = taCenter
                ReadOnly = True
                ImageOptions.Visible = True
                ImageOptions.Width = 30
              end>
          end
        end
      end
      inherited tbs_group_observation: TUniTabSheet
        TabVisible = False
      end
      inherited tbs_group_optional: TUniTabSheet
        TabVisible = False
      end
    end
  end
  inherited cds_measure: TClientDataSet
    PersistDataPacket.Data = {
      EB0000009619E0BD020000001800000008000000000003000000EB00066D656E
      75496404000100000000000B6465736372697074696F6E020049000000010005
      574944544802000200E803096D65617375726549640400010000000000076D65
      617375726501004900000001000557494454480200020064000770726F647563
      7404000100000000000970726963655F74616709001200000002000844454349
      4D414C53020002000600055749445448020002000D00086C696E6B5F75726C02
      0049000000010005574944544802000200FF001174625F696E73746974757469
      6F6E5F696404000100000000000000}
    Active = True
    AggregatesActive = True
    ProviderName = ''
    object cds_measuremenuId: TIntegerField
      FieldName = 'menuId'
      Origin = 'id'
    end
    object cds_measuredescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 1000
    end
    object cds_measuremeasureId: TIntegerField
      FieldName = 'measureId'
      Origin = 'id'
      ProviderFlags = []
    end
    object cds_measuremeasure: TStringField
      FieldName = 'measure'
      Origin = 'description'
      ProviderFlags = []
      Size = 100
    end
    object cds_measureproduct: TIntegerField
      FieldName = 'product'
      Origin = 'tb_product_id'
      ProviderFlags = []
    end
    object cds_measureprice_tag: TFMTBCDField
      FieldName = 'price_tag'
      Origin = 'price_tag'
      ProviderFlags = []
      DisplayFormat = '0.00'
      Precision = 13
      Size = 6
    end
    object cds_measurelink_url: TStringField
      FieldName = 'link_url'
      Origin = 'link_url'
      ProviderFlags = []
      Size = 255
    end
    object cds_measuretb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInKey]
    end
    object cds_measureactive: TStringField
      FieldKind = fkCalculated
      FieldName = 'active'
      Size = 1
      Calculated = True
    end
  end
  inherited FileRestMenu: TUniFileUpload
    Left = 496
    Top = 288
  end
  inherited Mnu_Img_Rest: TUniPopupMenu
    Left = 392
    Top = 288
  end
  object FileRestGroupHasMeasure: TUniFileUpload
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please select a file'
    Messages.BrowseText = 'Browse...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    OnCompleted = FileRestGroupHasMeasureCompleted
    Left = 784
    Top = 288
  end
  object Mnu_Img_Measure: TUniPopupMenu
    Left = 672
    Top = 280
    object popResBeverageInsertImagem: TUniMenuItem
      Caption = 'Inserir Imagem'
      OnClick = popResBeverageInsertImagemClick
    end
    object popResBeverageDeleteImagem: TUniMenuItem
      Caption = 'Excluir Imagem'
      OnClick = popResBeverageDeleteImagemClick
    end
  end
end
