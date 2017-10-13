1. 그룹
 - 클래스
 - 포스팅
2. 메세징
 - sender / receiver
3. 멤버
4. 스팟
5. 포스팅

- Group
    - [index](#group_index) 추천 그룹 리스트보기
    - [my_index](#group_my_index) 내가 가입 된 그룹 보기
 

## api.doc

#### Group

> <a href="#group_index">GET : /member/groups</a>
```json
[
    {
        "id": 1,
        "manager_id": 21,
        "name": "Group-0",
        "category": "파티",
        "premium": null,
        "created_at": "2017-10-12T05:12:57.985Z",
        "updated_at": "2017-10-12T05:12:57.985Z",
        "group_detail": {
            "id": 1,
            "location": "강남",
            "about": "해당 그룹에 대한 소개 입니다. 함께 즐거운 시간 보내요.",
            "pic_thumb": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/1/pics/thumb/denby-wolf-of-wall-street.jpg?1507785178",
            "pic_medium": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/1/pics/medium/denby-wolf-of-wall-street.jpg?1507785178",
            "pic_large": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/1/pics/xhdpi_4by3/denby-wolf-of-wall-street.jpg?1507785178",
            "pic_original": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/1/pics/original/denby-wolf-of-wall-street.jpg?1507785178"
        },
        "manager": {
            "id": 21,
            "email": "manager-0@sling.com",
            "remember_created_at": null,
            "sign_in_count": 0,
            "current_sign_in_at": null,
            "last_sign_in_at": null,
            "current_sign_in_ip": null,
            "last_sign_in_ip": null,
            "created_at": "2017-10-12T05:12:57.958Z",
            "updated_at": "2017-10-12T05:12:57.958Z"
        },
        "users": [
            {
                "id": 1,
                "email": "user-0@sling.com",
                "reset_password_token": null,
                "reset_password_sent_at": null,
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:55.261Z",
                "updated_at": "2017-10-12T05:12:55.261Z",
                "authentication_token": "_aoJ-93gCvyjtH97yov_"
            },
            {
                "id": 6,
                "email": "user-5@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:55.990Z",
                "updated_at": "2017-10-12T05:12:55.990Z"
            },
            {
                "id": 12,
                "email": "user-11@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:56.793Z",
                "updated_at": "2017-10-12T05:12:56.793Z"
            },
            {
                "id": 15,
                "email": "user-14@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:57.188Z",
                "updated_at": "2017-10-12T05:12:57.188Z"
            },
            {
                "id": 19,
                "email": "user-18@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:57.702Z",
                "updated_at": "2017-10-12T05:12:57.702Z"
            }
        ]
    },
    {
        "id": 2,
        "manager_id": 22,
        "name": "Group-1",
        "category": "부동산",
        "premium": null,
        "created_at": "2017-10-12T05:13:00.177Z",
        "updated_at": "2017-10-12T05:13:00.177Z",
        "group_detail": {
            "id": 2,
            "location": "강남",
            "about": "해당 그룹에 대한 소개 입니다. 함께 즐거운 시간 보내요.",
            "pic_thumb": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/2/pics/thumb/denby-wolf-of-wall-street.jpg?1507785180",
            "pic_medium": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/2/pics/medium/denby-wolf-of-wall-street.jpg?1507785180",
            "pic_large": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/2/pics/xhdpi_4by3/denby-wolf-of-wall-street.jpg?1507785180",
            "pic_original": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/2/pics/original/denby-wolf-of-wall-street.jpg?1507785180"
        },
        "manager": {
            "id": 22,
            "email": "manager-1@sling.com",
            "remember_created_at": null,
            "sign_in_count": 0,
            "current_sign_in_at": null,
            "last_sign_in_at": null,
            "current_sign_in_ip": null,
            "last_sign_in_ip": null,
            "created_at": "2017-10-12T05:13:00.159Z",
            "updated_at": "2017-10-12T05:13:00.159Z"
        },
        "users": [
            {
                "id": 7,
                "email": "user-6@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:56.128Z",
                "updated_at": "2017-10-12T05:12:56.128Z"
            },
            {
                "id": 8,
                "email": "user-7@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:56.262Z",
                "updated_at": "2017-10-12T05:12:56.262Z"
            },
            {
                "id": 9,
                "email": "user-8@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:56.395Z",
                "updated_at": "2017-10-12T05:12:56.395Z"
            },
            {
                "id": 14,
                "email": "user-13@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:57.053Z",
                "updated_at": "2017-10-12T05:12:57.053Z"
            },
            {
                "id": 18,
                "email": "user-17@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:57.577Z",
                "updated_at": "2017-10-12T05:12:57.577Z"
            }
        ]
    },
    {
        "id": 3,
        "manager_id": 23,
        "name": "Group-2",
        "category": "와인",
        "premium": null,
        "created_at": "2017-10-12T05:13:01.119Z",
        "updated_at": "2017-10-12T05:13:01.119Z",
        "group_detail": {
            "id": 3,
            "location": "강남",
            "about": "해당 그룹에 대한 소개 입니다. 함께 즐거운 시간 보내요.",
            "pic_thumb": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/3/pics/thumb/denby-wolf-of-wall-street.jpg?1507785181",
            "pic_medium": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/3/pics/medium/denby-wolf-of-wall-street.jpg?1507785181",
            "pic_large": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/3/pics/xhdpi_4by3/denby-wolf-of-wall-street.jpg?1507785181",
            "pic_original": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/3/pics/original/denby-wolf-of-wall-street.jpg?1507785181"
        },
        "manager": {
            "id": 23,
            "email": "manager-2@sling.com",
            "remember_created_at": null,
            "sign_in_count": 0,
            "current_sign_in_at": null,
            "last_sign_in_at": null,
            "current_sign_in_ip": null,
            "last_sign_in_ip": null,
            "created_at": "2017-10-12T05:13:01.102Z",
            "updated_at": "2017-10-12T05:13:01.102Z"
        },
        "users": [
            {
                "id": 2,
                "email": "user-1@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:55.463Z",
                "updated_at": "2017-10-12T05:12:55.463Z"
            },
            {
                "id": 3,
                "email": "user-2@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:55.599Z",
                "updated_at": "2017-10-12T05:12:55.599Z"
            },
            {
                "id": 10,
                "email": "user-9@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:56.524Z",
                "updated_at": "2017-10-12T05:12:56.524Z"
            },
            {
                "id": 12,
                "email": "user-11@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:56.793Z",
                "updated_at": "2017-10-12T05:12:56.793Z"
            },
            {
                "id": 23,
                "email": "manager-2@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:13:01.102Z",
                "updated_at": "2017-10-12T05:13:01.102Z"
            }
        ]
    },
    {
        "id": 4,
        "manager_id": 24,
        "name": "Group-3",
        "category": "등산",
        "premium": null,
        "created_at": "2017-10-12T05:13:02.537Z",
        "updated_at": "2017-10-12T05:13:02.537Z",
        "group_detail": {
            "id": 4,
            "location": "강남",
            "about": "해당 그룹에 대한 소개 입니다. 함께 즐거운 시간 보내요.",
            "pic_thumb": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/4/pics/thumb/denby-wolf-of-wall-street.jpg?1507785182",
            "pic_medium": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/4/pics/medium/denby-wolf-of-wall-street.jpg?1507785182",
            "pic_large": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/4/pics/xhdpi_4by3/denby-wolf-of-wall-street.jpg?1507785182",
            "pic_original": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/4/pics/original/denby-wolf-of-wall-street.jpg?1507785182"
        },
        "manager": {
            "id": 24,
            "email": "manager-3@sling.com",
            "remember_created_at": null,
            "sign_in_count": 0,
            "current_sign_in_at": null,
            "last_sign_in_at": null,
            "current_sign_in_ip": null,
            "last_sign_in_ip": null,
            "created_at": "2017-10-12T05:13:02.520Z",
            "updated_at": "2017-10-12T05:13:02.520Z"
        },
        "users": [
            {
                "id": 7,
                "email": "user-6@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:56.128Z",
                "updated_at": "2017-10-12T05:12:56.128Z"
            },
            {
                "id": 15,
                "email": "user-14@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:57.188Z",
                "updated_at": "2017-10-12T05:12:57.188Z"
            },
            {
                "id": 17,
                "email": "user-16@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:57.449Z",
                "updated_at": "2017-10-12T05:12:57.449Z"
            },
            {
                "id": 21,
                "email": "manager-0@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:57.958Z",
                "updated_at": "2017-10-12T05:12:57.958Z"
            },
            {
                "id": 23,
                "email": "manager-2@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:13:01.102Z",
                "updated_at": "2017-10-12T05:13:01.102Z"
            }
        ]
    }
]
```

> <a href="#group_my_index">GET : /member/groups/my_index>
```json
[
    {
        "id": 1,
        "manager_id": 21,
        "name": "Group-0",
        "category": "파티",
        "premium": null,
        "created_at": "2017-10-12T05:12:57.985Z",
        "updated_at": "2017-10-12T05:12:57.985Z",
        "group_detail": {
            "id": 1,
            "location": "강남",
            "about": "해당 그룹에 대한 소개 입니다. 함께 즐거운 시간 보내요.",
            "pic_thumb": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/1/pics/thumb/denby-wolf-of-wall-street.jpg?1507785178",
            "pic_medium": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/1/pics/medium/denby-wolf-of-wall-street.jpg?1507785178",
            "pic_large": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/1/pics/xhdpi_4by3/denby-wolf-of-wall-street.jpg?1507785178",
            "pic_original": "https://s3-ap-northeast-2.amazonaws.com/astrobox/group_details/1/pics/original/denby-wolf-of-wall-street.jpg?1507785178"
        },
        "manager": {
            "id": 21,
            "email": "manager-0@sling.com",
            "remember_created_at": null,
            "sign_in_count": 0,
            "current_sign_in_at": null,
            "last_sign_in_at": null,
            "current_sign_in_ip": null,
            "last_sign_in_ip": null,
            "created_at": "2017-10-12T05:12:57.958Z",
            "updated_at": "2017-10-12T05:12:57.958Z"
        },
        "users": [
            {
                "id": 1,
                "email": "user-0@sling.com",
                "reset_password_token": null,
                "reset_password_sent_at": null,
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:55.261Z",
                "updated_at": "2017-10-12T05:12:55.261Z",
                "authentication_token": "_aoJ-93gCvyjtH97yov_"
            },
            {
                "id": 6,
                "email": "user-5@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:55.990Z",
                "updated_at": "2017-10-12T05:12:55.990Z"
            },
            {
                "id": 12,
                "email": "user-11@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:56.793Z",
                "updated_at": "2017-10-12T05:12:56.793Z"
            },
            {
                "id": 15,
                "email": "user-14@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:57.188Z",
                "updated_at": "2017-10-12T05:12:57.188Z"
            },
            {
                "id": 19,
                "email": "user-18@sling.com",
                "remember_created_at": null,
                "sign_in_count": 0,
                "current_sign_in_at": null,
                "last_sign_in_at": null,
                "current_sign_in_ip": null,
                "last_sign_in_ip": null,
                "created_at": "2017-10-12T05:12:57.702Z",
                "updated_at": "2017-10-12T05:12:57.702Z"
            }
        ]
    }
]
```

