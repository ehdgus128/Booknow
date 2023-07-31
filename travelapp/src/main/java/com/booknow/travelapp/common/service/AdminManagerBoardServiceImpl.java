package com.booknow.travelapp.common.service;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.booknow.travelapp.common.domain.AdminManagerBoardVO;
import com.booknow.travelapp.common.domain.paging.AmBoardPagingDTO;
import com.booknow.travelapp.common.mapper.AdminMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Primary
@Service
public class AdminManagerBoardServiceImpl implements AdminManagerBoardService{
    
    private AdminMapper adminMapper;

    @Override
    public List<AdminManagerBoardVO> getManagerBoardList(AmBoardPagingDTO amBoardPaging) {
        return adminMapper.selectManagerBoardList(amBoardPaging);
    }

    @Override
    public AdminManagerBoardVO getManagerBoard(Long tmBno) {
        return adminMapper.selectManagerBoard(tmBno);
    }

    @Override
    public boolean modifyManagerBoard(AdminManagerBoardVO managerBoard) {
        return (adminMapper.updateManagerBoard(managerBoard) == 1L);
    }

    @Override
    public boolean modifyManagerBoardDelFlag(Long tmBno) {
        return (adminMapper.updateManagerBoardDelFlag(tmBno) == 1L);
    }

    @Override
    public boolean removeManagerBoardDelFlagAll() {
        return (adminMapper.deleteManagerBoardDelFlagAll() > 0);
    }

    @Override
    public Long registerManagerBoard(AdminManagerBoardVO managerBoard) {
        adminMapper.insertManagerBoard(managerBoard);
        return managerBoard.getTmBno();
    }

    @Override
    public Long getRowTotal() {
        return adminMapper.selectRowTotal();
    }

}// AdminManagerBoardServiceImpl end
