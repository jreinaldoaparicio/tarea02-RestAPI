Feature: Item
  @Reinaldo
  Scenario: As a user I want to create a item so that organize my task

    Given I have authentication to todo.ly
    # consumiendo el request
    When I send POST request 'api/items.json' with json
    """
    {
       "Content":"ITEM-test-001"
    }
    """
    # Verificar el POST response
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
      "Id": "EXCLUDE",
      "Content": "ITEM-test-001",
      "ItemType": 1,
      "Checked": false,
      "ProjectId": null,
      "ParentId": null,
      "Path": "",
      "Collapsed": false,
      "DateString": "EXCLUDE",
      "DateStringPriority": 0,
      "DueDate": "",
      "Recurrence": "EXCLUDE",
      "ItemOrder": null,
      "Priority": 4,
      "LastSyncedDateTime": "EXCLUDE",
      "Children": [],
      "DueDateTime": "EXCLUDE",
      "CreatedDate": "EXCLUDE",
      "LastCheckedDate": "EXCLUDE",
      "LastUpdatedDate": "EXCLUDE",
      "Deleted": false,
      "Notes": "",
      "InHistory": false,
      "SyncClientCreationId": "EXCLUDE",
      "DueTimeSpecified": true,
      "OwnerId": "EXCLUDE"
    }
    """
    And I get the property value 'Id' and save on ID_ITEM
    And I get the property value 'Content' and save on NAME_ITEM

    When I send PUT request '/api/items/ID_ITEM.json' with json
    """
      {
       "Content":"NAME_ITEM Updated"
      }
    """
    # Verificar el PUT response
    Then I expected the response code 200
    And I expected the response body is equal
    """
      {
        "Id": ID_ITEM,
        "Content": "NAME_ITEM Updated",
        "ItemType": 1,
        "Checked": false,
        "ProjectId": null,
        "ParentId": null,
        "Path": "",
        "Collapsed": false,
        "DateString": "EXCLUDE",
        "DateStringPriority": 0,
        "DueDate": "",
        "Recurrence": null,
        "ItemOrder": "EXCLUDE",
        "Priority": 4,
        "LastSyncedDateTime": "EXCLUDE",
        "Children": [],
        "DueDateTime": "EXCLUDE",
        "CreatedDate": "EXCLUDE",
        "LastCheckedDate": "EXCLUDE",
        "LastUpdatedDate": "EXCLUDE",
        "Deleted": false,
        "Notes": "",
        "InHistory": false,
        "SyncClientCreationId": "EXCLUDE",
        "DueTimeSpecified": true,
        "OwnerId": "EXCLUDE"
      }
    """
    When I send DELETE request 'api/items/ID_ITEM.json' with json
    """
    """
     # Verificar el DELETE response
    Then I expected the response code 200

    When I send GET request 'api/items/ID_ITEM.json' with json
    """
    """
     # Verificar el GET/ID response
    Then I expected the response code 200
